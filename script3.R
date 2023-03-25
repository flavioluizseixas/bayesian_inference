library(bnlearn)
library(gRain)
library(openxlsx)

rm(list = ls())
dag <- read.dsc("Data/DS_SMOTE_save.dsc", debug = TRUE)
junction <- compile(as.grain(dag))

nodes <- nodes(dag)

# Obtenha os nomes dos nós
n1 <- c("N2", "N3", "N4")
n2 <- c("N14","N8","N15","N11","N16","N17","N55","N79","N12","N86","N7" )

n <- c(n1, n2)
n_name <- c("Age", "Gender", "Education")
n_name <- c(n_name, "Mini mental state score", "Clinical dementia rating scale", "Verbal fluency test score",
            "Pfeffer questionnaire score", "Clock drawing test scale", "Trial making test",
            "Stroop color word test", "Lawton scale", "IQCode score", "Berg balance scale",
            "Depression")

# Obtenha os estados correspondentes a cada nó
states <- lapply(n1, function(node) node = names(coef(dag[[node]])))
states <- c(states,
            lapply(n2, function(node) rownames(coef(dag[[node]]))))
names(states) <- c(n1, n2)

# respostas usando o método de inferência gRain
resp <- data.frame()

for (i in seq_along(states)) {
  chave <- names(states)[i]
  elementos <- states[[i]]

  for (j in seq_along(elementos)) {
    variavelY <- chave
    valorY <- elementos[j]

    resp <- rbind(resp, node = variavelY, state = valorY)
  }
}




    e <- setEvidence(junction,
                     nodes = chave,
                     states = elementos[j])
    r <- querygrain(e, nodes = c("N6"),
                    type = "marginal")

    p <- c(r$N6[1], r$N6[2])
    h <- -sum(p * log2(p))
    if (r$N6[1] == 0 || r$N6[2] == 0) {
      h = 0
    }

    resp <- rbind(resp,
                   data.frame(node = n_name[which(n == chave)],
                              state = elementos[j],
                              prob_positive = r$N6[2],
                              entropy = h,
                              row.names = nrow(resp)+1))

  }

  #write.xlsx(resp, "Data/resultados-grain.xlsx", sheetName = "Resultados")
}

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
n_id <- c(n1, n2)

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

df <- data.frame()
for (i in seq_along(states)) {
  chave <- names(states)[i]
  elementos <- states[[i]]

  for (j in seq_along(elementos)) {
    df <- rbind(df, data.frame(node = chave, state = elementos[j]))
  }
}

n <- 4
comb <- combn(nrow(df), n)
combs <- data.frame()

for (i in seq_len(ncol(comb))) {
  row <- data.frame()
  if (anyDuplicated(df[comb[1:n,i],1]) == 0) {
    for (j in seq_len(nrow(comb))) {
      if (ncol(row) == 0) {
        row <- cbind(data.frame(node = df[comb[j,i],1], state = df[comb[j,i],2]))
      }
      else {
        row <- cbind(row, data.frame(node = df[comb[j,i],1], state = df[comb[j,i],2]))
      }
    }
    combs <- rbind(combs, row)
  }
}

resp <- data.frame()
for (i in seq_len(nrow(combs))) {
  nodes <- c()
  states <- c()

  for (j in seq(1, ncol(comb), 2)) {
    nodes <- c(nodes, combs[i, j])
    states <- c(states, combs[i, j+1])
  }

  e <- setEvidence(junction,
                   nodes = nodes,
                   states = states)

  r <- querygrain(e, nodes = c("N6"),
                    type = "marginal")

  if (is.nan(r$N6[1]) || is.nan(r$N6[2])) {
    p_pos <- -1
    h <- 0
  }
  else {
    p <- c(r$N6[1], r$N6[2])
    h <- -sum(p * log2(p))
    if (r$N6[1] == 0 || r$N6[2] == 0) {
      h = 0
    }
    p_pos <- r$N6[2]
  }

  resp <- rbind(resp, data.frame(p_pos = p_pos, entropy = h, row.names = nrow(resp)+1))

}

# substitui o identificador pelo nome do nodo
for (j in seq(1,n*2,2)) {
  for (i in 1:length(n_id)) {
    combs[which(combs[[j]] == n_id[i]), j] <- n_name[i]
  }
}

# retira o "S_" do estado
for (j in seq(2,n*2,2)) {
  combs[, j] <- sapply(combs[, j], function(x) substring(x, 3))
}
combs = cbind(combs, resp)

filename <- paste0("Data/resultados-comb-", n, ".xlsx")
sheetname <- paste0("Combinação de ", n)
write.xlsx(combs, filename, sheetName = sheetname)


library(bnlearn)
library(gRain)

rm(list = ls())
bn <- read.dsc("Data/DS_SMOTE_save.dsc", debug = TRUE)

junction <- compile(as.grain(bn))

e <- setEvidence(junction,
                 nodes = c("N3", "N4"),
                 states = c("S_male", "S_14_inf"))

querygrain(e, nodes = c("N6"),
                     type = "marginal")

cpquery(bn, event = (N6 == "S_positive"),
        evidence = (N3 == "S_male") & (N4 == "S_14_inf"),
        method = "ls", n = 10^6)

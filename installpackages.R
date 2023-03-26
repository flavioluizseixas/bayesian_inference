install.packages(c("pcalg", "catnet", "abn"))

install.packages("bnlearn")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.16")

#if (!require("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install()

BiocManager::install(c("graph", "Rgraphviz", "RBGL"))
install.packages("gRbase", dependencies = TRUE)

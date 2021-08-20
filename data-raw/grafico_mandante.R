library(dplyr)
library(tidyr)
library(ggplot2)

source("R/grafico.R")
source("R/import.R")

brasileirao <- importar_dados_bra("data/brasileirao.rds")

brasileirao %>%
  fazer_grafico_mandante()

ggsave("docs/grafico_mandantes.png")

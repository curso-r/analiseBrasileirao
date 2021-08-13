library(readr)

# nome_arquivo <- paste0("data-raw/csv/brasileirao_", Sys.Date(), ".csv")

download.file(
  url = "https://raw.githubusercontent.com/williamorim/brasileirao/master/data-raw/csv/matches.csv",
  destfile = "data-raw/csv/brasileirao.csv"
  # destfile = nome_arquivo
)

brasileirao <- read_csv("data-raw/csv/brasileirao.csv")

# Arrumação dos dados

write_rds(brasileirao, "data/brasileirao.rds")

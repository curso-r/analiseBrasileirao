library(dplyr)
library(tidyr)

brasileirao <- readr::read_rds("data/brasileirao.rds")

# testa se todas as linhas da coluna score tem x
brasileirao %>%
  mutate(
    tem_x = stringr::str_detect(score, "x")
  ) %>%
  filter(tem_x == FALSE)

brasileirao %>%
  separate(
    col = "score",
    into = c("gols_mandante", "gols_visitante"),
    sep = "x",
    remove = FALSE
    # convert = TRUE
  ) %>%
  mutate(
    across(
      .cols = starts_with("gols"),
      .fns = as.numeric
    ),
    vitoria_mandante = gols_mandante > gols_visitante
  ) %>%
  View()



brasileirao %>%
  separate(
    col = "home",
    into = c("nome_1", "nome_2"),
    sep = " ",
    remove = FALSE
  ) %>%
  View()

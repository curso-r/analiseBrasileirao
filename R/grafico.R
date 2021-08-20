fazer_grafico_mandante <- function(tab) {
  tab %>%
    filter(season != 2021) %>%
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
    group_by(season) %>%
    summarise(
      num_vitorias_mandante = sum(vitoria_mandante, na.rm = TRUE),
      num_jogos = n()
    ) %>%
    mutate(
      prop_vitoria_mandante = num_vitorias_mandante / num_jogos
    ) %>%
    ggplot(aes(x = season, y = prop_vitoria_mandante)) +
    geom_line()
}

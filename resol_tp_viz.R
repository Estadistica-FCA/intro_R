pacman::p_load(rio, tidyverse)

g1 <- novillos %>%
  filter(Procedencia != "NA") %>%
  ggplot(.) +
  aes(x = GPV_anterior, y = as.factor(Tropa)) +
  geom_boxplot() +
  theme_bw()  +
  facet_wrap(~ Procedencia)

g2 <-  ggplot(novillos) +
  aes(x = Peso, group = Tropa, fill = as.factor(Tropa)) +
  geom_histogram() +
  theme(legend.position = "bottom")

pacman::p_load(patchwork)
g1 / g2




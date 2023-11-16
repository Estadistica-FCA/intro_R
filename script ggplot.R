# Visualización de datos con `ggplot2`

pacman::p_load(rio, tidyverse)



# set de datos
novillos <- import("datasets/pesada_novillos.xlsx")
novillos


# Grafico: Primero definimos el set de datos que usaremos:

ggplot(data = novillos)

# Mapping: estética: aes()

gplot(data = novillos) +
  aes(x = Peso_inicial, y = Peso)

# geometría: puntos

ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso) +
  geom_point()

## agregar linea

ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso) +
  geom_point() +
  geom_line(stat = 'smooth', method = 'lm')

# lo mismo:

ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso) +
  geom_point() +
  stat_smooth(method = "lm")



# atributos esteticos: 

## color

ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso, color = Procedencia) +
  geom_point() +
  geom_line(stat = 'smooth', method = 'lm')

## shape

ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso, shape = Procedencia) +
  geom_point() +
  geom_line(stat = 'smooth', method = 'lm')

## shape y color

ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso, shape = Procedencia, 
      color = Peso_inicial) +
  geom_point() +
  geom_line(aes(group = Procedencia), stat = "smooth", method = "lm")


# Usando labs()
ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso, color = Procedencia) +
  geom_point() +
  geom_line(stat = "smooth", method = "lm") +
  labs(x = "Peso anterior (kg)", y = "Peso actual (kg)",
       color = "Procedencia", title = "Relación peso anterior y actual") +
  theme_bw()


# Modificar el tema
mi_tema <- theme_bw() + theme(panel.grid = element_blank())

# Aplicar nuestro nuevo tema
ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso, color = Procedencia) +
  geom_point() +
  geom_line(stat = 'smooth', method = 'lm') + 
  labs(x = "Peso anterior (kg)", y = "Peso actual (kg)",
       color = "Procedencia", title = "Relación peso anterior y actual") +
  mi_tema


# Grafico de barras
ggplot(novillos) +
  aes(x = Procedencia) +
  geom_bar(fill = 'orange') +
  labs(x = "Procedencia", y = "Cantidad", 
       title = "Cantidad de Novillos por Procedencia") +
  mi_tema

#### ACTIVIDAD

#### 


#  `facets`

## facet_wrap()
ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso) +
  geom_point() +
  geom_line(stat = 'smooth', method = 'lm') +
  facet_wrap(~ Procedencia)

## facet_grid()
ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso) +
  geom_point() +
  geom_line(stat = 'smooth', method = 'lm') +
  facet_grid(Tropa ~ Procedencia)

# scales
ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso) +
  geom_point() +
  geom_line(stat = 'smooth', method = 'lm') +
  facet_grid(Tropa ~ Procedencia, scales = "free")


#### ACTIVIDAD

#### 


# `patchwork`
pacman::p_load(patchwork)

# guardar los gráficos en objetos

g1 <- ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso, color = Procedencia) +
  geom_point() +
  geom_line(stat = 'smooth', method = 'lm') +  
  mi_tema

g2 <- ggplot(data = novillos) +
  aes(x = Peso_anterior, y = Peso, color = Procedencia) +
  geom_boxplot() 

g3 <- ggplot(data = novillos) +
  aes(y = Peso, fill = Procedencia) +
  geom_histogram()

## Para organizar los gráficos en columnas
  
g1 + g2


## Para organizar los gráficos en filas

g1 / g2


## Para combinar varios gráficos

(g1 + g2) / g3

g1 + g2 + g3 + g1



#### ACTIVIDAD

#### 

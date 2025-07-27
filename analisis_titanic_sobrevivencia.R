install.packages("Tidyverse")

getwd ()
setwd("~/DIPLOMADO ANALISIS DE DATOS_TRANSICION_UNIV. COLIMA/R/Material practico/Caso practico")

library(tidyverse)
db_titanic <- read.csv("Titanicv2.csv")

head(db_titanic)
str(db_titanic)
summary(db_titanic)

db_titanic %>%
  group_by(Pclass, Survived) %>%
  summarise(total = n(), .groups = "drop") %>%
  mutate(percentage = (total / sum(total)) * 100)
head(db_titanic)

ggplot(db_titanic, aes(x = Age, fill = factor(Survived))) +
  geom_histogram(binwidth = 5, alpha = 0.6, position = "identity") +
  labs(title = "Sobrevivencia por edad",
       x = "Edad",
       y = "Frecuencia") +
  theme_minimal()

ggplot(db_titanic, aes(x = factor(Survived), y = Fare, fill = factor(Survived))) +
  geom_boxplot() +
  labs(title = "Sobrevivencia por Costo del ticket",
       x = "Supervivencia",
       y = "Costo del Ticket") +
  theme_minimal()

ggplot(db_titanic, aes(x = Age, y = Fare, color = factor(Survived))) +
  geom_point(alpha = 0.7) +
  labs(title = "Sobrevivencia poredad y el costo del boleto",
       x = "Edad",
       y = "Costo del boleto") +
  theme_minimal()

db_titanic %>%
  group_by(Embarked, Survived) %>%
  summarise(total = n(), .groups = "drop") %>%
  mutate(percentage = (total / sum(total)) * 100)


library(rmarkdown)

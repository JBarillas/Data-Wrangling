### Problema1 ###
library(readxl)
library(readr)
library(tidyverse)
library(writexl)


excel1 = read_excel('01-2018.xlsx')
excel2 = read_excel('02-2018.xlsx')
excel3 = read_excel('03-2018.xlsx')
excel4 = read_excel('04-2018.xlsx')
excel5 = read_excel('05-2018.xlsx')
excel6 = read_excel('06-2018.xlsx')
excel7 = read_excel('07-2018.xlsx')
excel8 = read_excel('08-2018.xlsx')
excel9 = read_excel('09-2018.xlsx')
excel10 = read_excel('10-2018.xlsx')
excel11 = read_excel('11-2018.xlsx')
excel10$TIPO = NULL
excel11$TIPO = NULL
excel7$TIPO = NULL
excel8$...10 = NULL
excel8$TIPO = NULL
excel9$TIPO = NULL

excel1$Fecha = "01-2018"
excel2$Fecha = "02-2018"
excel3$Fecha = "03-2018"
excel4$Fecha = "04-2018"
excel5$Fecha = "05-2018"
excel6$Fecha = "06-2018"
excel7$Fecha = "07-2018"
excel8$Fecha = "08-2018"
excel9$Fecha = "09-2018"
excel10$Fecha = "10-2018"
excel11$Fecha = "11-2018"
final = rbind(excel1,excel2,excel3,excel4,excel5,excel6,excel7,excel8,excel9,excel10, excel11)
write.csv(final,'datasetfinal.csv')


### Problema2 ###
v1 <- c(4,1,6,8,5,2,3,1,8,7,9,5,4,3,2,8,1,6)
v2<- c(5,1,8,4,6,2,5,1,3,5,8,9,4,3,2,1,8,4,6,2)
v3 <- c(8,1,6,5,4,3,2,5,8,7,9,4,8,5,2,3,4,5,4,4)
list_vector <- list(v1,v2,v3)

calculate_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

lapply(list_vector, calculate_mode)


### Problema3 ###
problema3 = read.delim("INE_PARQUE_VEHICULAR_080219.txt", header=TRUE, sep="|")
head(problema3)
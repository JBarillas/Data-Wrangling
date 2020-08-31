```{r}
library(tidyverse)
library(readr)
library(dplyr)
library(igraph)
library(ggplot2)
library(magrittr)

data <- read_csv("tabla_completa.csv", locale = readr::locale(encoding = "latin1"))
data <- data %>%
  separate(CLIENTE, c("CLIENTE","MOTIVO"), sep = "\\/ |\\|\\|\\|")

data$MOTIVO <- tolower(data$MOTIVO)
data
```

## Debemos invertir en la contratacion de mas personal?
## Tenemos que calcular cuantas entregas realizan los empleados y ver si es necesario reducirlo contratando m[as gente.]
```{r}
pilotos <- data %>%
  #Cantidad de pilotos
  count(PILOTO)

entregas_piloto <- data %>%
  group_by(MES) %>%
  count(PILOTO)

mensuales = aggregate(entregas_piloto$n, by=list(MES=entregas_piloto$MES), FUN=sum)
mensuales %>%
  mutate(AVG = x/9)

count(PILOTO)
### Los pilotos tienen entre 21 y 23 entregas al mes por lo que hacen 1 entrega por d[ia en un mes lo que no es un numero alto y no se necesita contratar a mas personas.]
```

####################################################################################################
## Debemos invertir en la compra de mas vehiculos de distribuci[on?] Cu[antos y de que tipo?]

```{r}
n_entregas <- data %>%
  count(UNIDAD)

producto_camion <- aggregate(data$CANTIDAD, by=list(UNIDAD=data$UNIDAD), FUN=sum)
grandes <- data %>%
  filter(UNIDAD == "Camion Grande")

chiquito <- data %>%
  filter(UNIDAD == "Camion Pequeño")

panel <- data %>%
  filter(UNIDAD == "Panel")


#Promedio de cantidad de producto entregada
cat("Promedio de cantidad:", mean(data$CANTIDAD))

prueba <- cbind(n_entregas, cantidad=producto_camion$x)
prueba %>%
  mutate(avg = cantidad/n)

#Numero de entregas por mes de camiones grandes
data %>%
  filter(UNIDAD == "Camion Grande") %>%
  group_by(MES) %>% 
  count(MES)
#Numero de entregas por mes de camiones pequeños
data %>%
  filter(UNIDAD == "Camion Pequeño") %>%
  group_by(MES) %>% 
  count(MES)
#Numero de entregas por mes de paneles
data %>%
  filter(UNIDAD == "Panel") %>%
  group_by(MES) %>% 
  count(MES)

```

#####################################################################################################
## Las tarifas actuales son aceptables por el cliente?

```{r}
data %>% 
  mutate(PrecioPorUnidad=Q/CANTIDAD)

aggregate(entregas_piloto$n, by=list(MES=entregas_piloto$MES), FUN=sum)
cat("Precio por unidad", (data$Q/data$CANTIDAD))

#Todas las tarifas son las mismas por producto de $0.25 y podemos ver que existen siempre pedidos regulares por lo que podemos inferir que el precio es aceptado por nuestros clientes

```



################################################Que estrategias debo seguir? ################################################

####Conseguir mas entregas para que los pilotos no solo hagan un viaje por dia
#### Comprar mas camiones peque;os ya que tienenden a aumentar en viajes a trav[es de los meses en el a;o o comprar camiones grandes debido a que nos generan la mayor cantidad de ingresos
#### Llevar un mejor control de entregar segmentando mejor la informaci[on]


## 80-20
```{r}
ventas <- aggregate(data$Q, by=list(CLIENTE=data$CLIENTE), FUN=sum)
ventas

barplot(ventas$x, names.arg = ventas$CLIENTE, las=2, cex.names = 0.5, space = 1, main = "Total de compras por cliente en Q")
```

######################################################################### Mejores pilotos y transportes mas efectivos
```{r}
entregas_piloto <= data %>%
  filter(is.na(MOTIVO)) %>%
  count(PILOTO)

barplot(entregas_piloto$n, names.arg = entregas_piloto$PILOTO, las=2, cex.names = 0.75, space=1, main = "Entregas sin problemas por piloto")

```

```{r}
entregas_piloto <- data %>%
  filter(is.na(MOTIVO)) %>%
  count(UNIDAD)

barplot(entregas_piloto$n, names.arg = entregas_piloto$UNIDAD, las=2, cex.names = 0.75, space=1, main = "Entregas exitosas por unidad")

```







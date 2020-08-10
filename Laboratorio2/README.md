Laboratorio1Markdown
================
Juan Barillas
9/8/2020

# Ejercicio1

``` r
library(readxl)
library(readr)
library(tidyverse)
```

    ## -- Attaching packages -------------------------------------------------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.3.2     v dplyr   1.0.0
    ## v tibble  3.0.3     v stringr 1.4.0
    ## v tidyr   1.1.1     v forcats 0.5.0
    ## v purrr   0.3.4

    ## -- Conflicts ----------------------------------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(writexl)


excel1 = read_excel('01-2018.xlsx')
excel2 = read_excel('02-2018.xlsx')
excel3 = read_excel('03-2018.xlsx')
excel4 = read_excel('04-2018.xlsx')
excel5 = read_excel('05-2018.xlsx')
excel6 = read_excel('06-2018.xlsx')
excel7 = read_excel('07-2018.xlsx')
excel8 = read_excel('08-2018.xlsx')
```

    ## New names:
    ## * `` -> ...10

``` r
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
head(final)
```

    ## # A tibble: 6 x 9
    ##   COD_VIAJE CLIENTE      UBICACION CANTIDAD PILOTO        Q CREDITO UNIDAD Fecha
    ##       <dbl> <chr>            <dbl>    <dbl> <chr>     <dbl>   <dbl> <chr>  <chr>
    ## 1  10000001 EL PINCHE O~     76002     1200 Fernando~ 300        30 Camio~ 01-2~
    ## 2  10000002 TAQUERIA EL~     76002     1433 Hector A~ 358.       90 Camio~ 01-2~
    ## 3  10000003 TIENDA LA B~     76002     1857 Pedro Al~ 464.       60 Camio~ 01-2~
    ## 4  10000004 TAQUERIA EL~     76002      339 Angel Va~  84.8      30 Panel  01-2~
    ## 5  10000005 CHICHARRONE~     76001     1644 Juan Fra~ 411        30 Camio~ 01-2~
    ## 6  10000006 UBIQUO LABS~     76001     1827 Luis Jai~ 457.       30 Camio~ 01-2~

# Ejercicio 2

``` r
v1 <- c(4,1,6,8,5,2,3,1,8,7,9,5,4,3,2,8,1,6)
v2<- c(5,1,8,4,6,2,5,1,3,5,8,9,4,3,2,1,8,4,6,2)
v3 <- c(8,1,6,5,4,3,2,5,8,7,9,4,8,5,2,3,4,5,4,4)
list_vector <- list(v1,v2,v3)

calculate_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

lapply(list_vector, calculate_mode)
```

    ## [[1]]
    ## [1] 1
    ## 
    ## [[2]]
    ## [1] 5
    ## 
    ## [[3]]
    ## [1] 4

# Ejercicio 3

``` r
problema3 = read.delim("INE_PARQUE_VEHICULAR_080219.txt", header=TRUE, sep="|")
```

    ## Warning in scan(file = file, what = what, sep = sep, quote = quote, dec = dec, :
    ## EOF within quoted string

``` r
head(problema3)
```

    ##   ANIO_ALZA MES NOMBRE_DEPARTAMENTO NOMBRE_MUNICIPIO MODELO_VEHICULO
    ## 1      2007   5       HUEHUETENANGO    HUEHUETENANGO            2007
    ## 2      2007   5         EL PROGRESO        EL JICARO            2007
    ## 3      2007   5          SAN MARCOS             OCOS            2007
    ## 4      2007   5           ESCUINTLA         SAN JOSÉ            2006
    ## 5      2007   5             JUTIAPA           MOYUTA            2007
    ## 6      2007   5           GUATEMALA        FRAIJANES            1997
    ##            LINEA_VEHICULO TIPO_VEHICULO USO_VEHICULO MARCA_VEHICULO CANTIDAD  X
    ## 1                SPORT125          MOTO  MOTOCICLETA      ASIA HERO        1 NA
    ## 2 BT-50 DBL CAB 4X2 TURBO       PICK UP   PARTICULAR          MAZDA        1 NA
    ## 3                   JL125          MOTO  MOTOCICLETA         KINLON        1 NA
    ## 4               JL125T-15          MOTO  MOTOCICLETA        JIALING        1 NA
    ## 5                 JH100-2          MOTO  MOTOCICLETA        JIALING        1 NA
    ## 6  TACOMA XTRA CAB 4X4 V6       PICK UP   PARTICULAR         TOYOTA        1 NA

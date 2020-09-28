Laboratorio5
================
Juan Barillas
27/9/2020

``` r
library(lubridate)
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following objects are masked from 'package:base':
    ## 
    ##     date, intersect, setdiff, union

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(readxl)
library(nycflights13)
library(DescTools)
```

Primera Parte: Predecir un eclipse solar

En tiempo de Norte América, el eclipse total inició el 21 de agosto del
2017 a las 18:26:40.

Este mismo evento, sucederá un Saros después. Un Saros equivale a 223
Synodic Months Un Synodic Month equivale a 29 días con 12 horas, con 44
minutos y 3 segundos.

Requisitos: ● Variable con la fecha del eclipse histórico. ● Variable
que sea un Saros. ● Variable que sea un Synodic Month. ● La fecha del
siguiente eclipse solar

``` r
start = make_datetime(day=21, month=8, year=2017, hour=18, min=26, sec=40)
start
```

    ## [1] "2017-08-21 18:26:40 UTC"

``` r
synodic_month = days(29) + hours(12) + minutes(44) + seconds(3)
synodic_month
```

    ## [1] "29d 12H 44M 3S"

``` r
saros = 223 * synodic_month
saros
```

    ## [1] "6467d 2676H 9812M 669S"

``` r
siguiente_elipse= start + saros
print("Next solar eclipse:")
```

    ## [1] "Next solar eclipse:"

``` r
siguiente_elipse
```

    ## [1] "2035-09-02 02:09:49 UTC"

Segunda Parte: Agrupaciones y operaciones con fechas

Tercera Parte: Signo Zodiacal

Realice una función que reciba como input su fecha de nacimiento y
devuelva como output su signo zodiacal.

``` r
signo_zodiacal <- function() {
  fecha_nacimiento <- readline(prompt="Ingrese su fecha de nacimiento (DD-MM-YYYY): ")
  fecha <- dmy(fecha_nacimiento)
  zodiaco <- Zodiac(fecha)
  print(zodiaco)
}
signo_zodiacal()
```

    ## Ingrese su fecha de nacimiento (DD-MM-YYYY): 
    ## [1] <NA>
    ## 12 Levels: Capricorn Aquarius Pisces Aries Taurus Gemini Cancer Leo ... Sagittarius

Cuarta Parte: Flights

Utilizando la tabla de flights vista en clase, responda lo siguiente:

dep\_time, arr\_time, sched\_dep\_time,sched\_arr\_time son variables
que representan la hora de salida de los aviones. Sin embargo, están en
formato numérico. Es decir, si una de las observaciones tiene 845 en
sched\_dep\_time y 932 en sched\_arr\_time significa que tenia como hora
de salida las 8:45 y llegada las 9:32.

1.  Genere 4 nuevas columnas para cada variable con formato fecha y
    hora.
2.  Encuentre el delay total que existe en cada vuelo. El delay total se
    puede encontrar sumando el delay de la salida y el delay de la
    entrada.

<!-- end list -->

``` r
flights
```

    ## # A tibble: 336,776 x 19
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 336,766 more rows, and 11 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>

``` r
flights <- flights %>% filter(!is.na(dep_time), !is.na(arr_time))

new_df <- flights %>% mutate(
    departure_time = ymd_hm(paste(year, month, day, dep_time %/% 100, ':', dep_time %% 100)),
    sched_departure = ymd_hm(paste(year, month, day, sched_dep_time  %/% 100, ':', sched_dep_time  %% 100)),
    arrival_time = ymd_hm(paste(year, month, day, arr_time  %/% 100, ':', arr_time  %% 100)),
    sched_arrival= ymd_hm(paste(year, month, day, sched_arr_time  %/% 100, ':', sched_arr_time  %% 100)),
  )


##Delay

delay_flights<- flights %>% mutate(delay = dep_delay + arr_delay)
tabla <- as.data.frame(delay_flights$delay)
```

Delays podemos encontrarla en el DF de Tabla que se encuentra unificado
en delay\_flights

``` r
delay_flights
```

    ## # A tibble: 328,063 x 20
    ##     year month   day dep_time sched_dep_time dep_delay arr_time sched_arr_time
    ##    <int> <int> <int>    <int>          <int>     <dbl>    <int>          <int>
    ##  1  2013     1     1      517            515         2      830            819
    ##  2  2013     1     1      533            529         4      850            830
    ##  3  2013     1     1      542            540         2      923            850
    ##  4  2013     1     1      544            545        -1     1004           1022
    ##  5  2013     1     1      554            600        -6      812            837
    ##  6  2013     1     1      554            558        -4      740            728
    ##  7  2013     1     1      555            600        -5      913            854
    ##  8  2013     1     1      557            600        -3      709            723
    ##  9  2013     1     1      557            600        -3      838            846
    ## 10  2013     1     1      558            600        -2      753            745
    ## # ... with 328,053 more rows, and 12 more variables: arr_delay <dbl>,
    ## #   carrier <chr>, flight <int>, tailnum <chr>, origin <chr>, dest <chr>,
    ## #   air_time <dbl>, distance <dbl>, hour <dbl>, minute <dbl>, time_hour <dttm>,
    ## #   delay <dbl>

O podemos ver los delays únicamente

``` r
head(tabla)
```

    ##   delay_flights$delay
    ## 1                  13
    ## 2                  24
    ## 3                  35
    ## 4                 -19
    ## 5                 -31
    ## 6                   8

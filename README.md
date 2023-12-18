# SARS-CoV-2-Epidemiology
A collection of codes for SARS-CoV-2 weekly surveillance

# PASO 1 : OBSERVAR CORRIDAS en R
```r
R
data <- read.csv("metadata_shiny.csv", header=TRUE)
sort(unique(data$gisaid))
sort(unique(data$VOC.VOI))
as.data.frame(table(data$VOC.VOI))
as.data.frame(table(data$gisaid))
quit("no")

### PASO 2 : ACTUALIZAR CORRIDA en el servidor http://10.120.12.96 ###

./metadaShiny_sql -n 1115 -o 1115_shiny ; 
./update_shiny 1115 metadata_shiny.csv ;

./metadaShiny_sql -n 1116 -o 1116_shiny ; 
./update_shiny 1116 metadata_shiny.csv ;

ls ;
```

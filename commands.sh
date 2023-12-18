#######################################
######### A : PRIMER SCRIPT ###########
#######################################

### PASO 1 : OBSERVAR CORRIDAS en R ###
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

#############################################
######### B : SEGUNDO SCRIPT en R ###########
#############################################

### PASO 3 : LEER LAS CORRIDAS ACTUALIZADAS ###
R

a1 <- read.csv("1115_shiny.csv", header=TRUE) ;
a2 <- read.csv("1116_shiny.csv", header=TRUE) ;

c <- rbind(a1,a2)

j <- read.csv("metadata_shiny.csv", header=TRUE) ;

names(c) <- names(j) ;
ac <- rbind(j,c) ;
dim(ac) ;
head(ac) ;  

write.csv(ac, "new_metadata.csv", row.names=FALSE) ; 

### PASO 4 : REPETIR PASO 1 (CORROBORAR) ###
data <- ac

### PASO 5 : CORREGIR COLUMNA "VOC.VOI" ###

sort(unique(data$lineage)) ; 
a <- gsub("B.1.617.2","Delta (B.1.617.2-like)",data$lineage) ;
b <- gsub("AY.*","Delta (B.1.617.2-like)",a) ;
c <- gsub("BA.1.*","Omicron (BA.1-like)",b) ; 
d <- gsub("BA.2.*","Omicron (BA.2-like)",c) ;
e <- gsub("BA.3.*","Omicron (BA.3-like)",d) ;
f <- gsub("BA.4.*","Omicron (BA.4-like)",e) ;
g <- gsub("BA.5.*","Omicron (BA.5-like)",f) ;
h <- gsub("B.1.1.529.*","Omicron (Unassigned)",g) ;
i <- gsub("B.1.621.*","Mu (B.1.621-like)",h) ;
j <- gsub("BC.*","Omicron (BA.1-like)",i) ;
k <- gsub("BE.*","Omicron (BA.5-like)",j) ;
l <- gsub("BF.*","Omicron (BA.5-like)",k) ;
m <- gsub("BG.*","Omicron (BA.2-like)",l) ;
n <- gsub("P.1.*","Gamma (P.1-like)",m) ;
o <- gsub("X.*","Recombinante",n) ;
p <- gsub("Unassigned","Unassigned",o) ;
q <- gsub("B.1.1.*","",p) ;
r <- gsub("C.36.*","",q) ;
s <- gsub("C.37.*","Lambda (C.37-like)",r) ;
t <- gsub("BB.*","Mu (B.1.621-like)",s) ;
u <- gsub("BL.*","Omicron (BA.2-like)",t) ;
v <- gsub("BN.*","Omicron (BA.2-like)",u) ;
w <- gsub("BQ.*","Omicron (BA.5-like)",v) ;
x <- gsub("BS.*","Omicron (BA.2-like)",w) ;
y <- gsub("BY.*","Omicron (BA.2-like)",x) ;
z <- gsub("CK.*","Omicron (BA.5-like)",y) ;
za <- gsub("BK.1*","Omicron (BA.5-like)",z) ;
zb <- gsub("BM.*","Omicron (BA.2-like)",za) ;
zc <- gsub("BW.*","Omicron (BA.5-like)",zb) ;
zd <- gsub("CA.*","Omicron (BA.2-like)",zc) ;
ze <- gsub("CH.*","Omicron (BA.2-like)",zd) ;
zf <- gsub("CL.*","Omicron (BA.5-like)",ze) ;
zg <- gsub("DJ.*","Omicron (BA.5-like)",zf) ;
zh <- gsub("CM.*","Omicron (BA.2-like)",zg) ;
zi <- gsub("BU.*","Omicron (BA.5-like)",zh) ;
zj <- gsub("DE.*","Omicron (BA.5-like)",zi) ;
zk <- gsub("DG.*","Omicron (BA.5-like)",zj) ;
zl <- gsub("DL.*","Omicron (BA.5-like)",zk) ;
zm <- gsub("BR.*","Omicron (BA.2-like)",zl) ;
zn <- gsub("CV.*","Omicron (BA.2-like)",zm) ;
zo <- gsub("DM.*","Omicron (BA.5-like)",zn) ;
zp <- gsub("FD.*","Recombinante",zo) ;
zq <- gsub("EF.*","Omicron (BA.5-like)",zp) ;
zr <- gsub("EE.*","Omicron (BA.5-like)",zq) ;
zs <- gsub("EU.*","Recombinante",zr) ;
zt <- gsub("FH.*","Recombinante",zs) ;
zu <- gsub("FE.*","Recombinante",zt) ;
zv <- gsub("EG.*","Recombinante",zu) ;
zw <- gsub("FL.*","Recombinante",zv) ;
zx <- gsub("GH.*","Recombinante",zw) ;
zy <- gsub("GN.*","Recombinante",zx) ;
zz <- gsub("ED.*","Omicron (BA.5-like)",zy) ;
zza <- gsub("FU.*","Recombinante",zz) ;
zzb <- gsub("GK.*","Recombinante",zza) ;
zzc <- gsub("GJ.*","Recombinante",zzb) ;
zzd <- gsub("H.*","Recombinante",zzc) ;
zze <- gsub("JA.*","Recombinante",zzd) ;
zzf <- gsub("GW.*","Recombinante",zze) ;
zzg <- gsub("GE.*","Recombinante",zzf) ;
zzh <- gsub("GS.*","Recombinante",zzg) ;
zzi <- gsub("JD.*","Recombinante",zzh) ;
zzj <- gsub("JF.*","Recombinante",zzi) ;
zzk <- gsub("JG.*","Recombinante",zzj) ;
             
sort(unique(zzk)) ; 
data$VOC.VOI <- zzk ; 
as.data.frame(table(data$VOC.VOI)) ; 
as.data.frame(table(data$lineage)) ; 

a <- gsub("Cuzco","Cusco",data$region) ;
b <- gsub("Lima Centro","Lima",a) ;
c <- gsub("Lima Este","Lima",b) ;
d <- gsub("Lima Norte","Lima",c) ;
e <- gsub("Lima Provincia","Lima",d) ;
f <- gsub("Lima Sur","Lima",e) ;
g <- gsub("Madre De Dios","Madre de Dios",f) ;
h <- gsub("Iquitos","Loreto",g) ;
i <- gsub("Metropolitan Municipality of Lima","Lima",h) ;

data$region <- i ;
as.data.frame(table(data$region)) ; 

write.csv(data, "new_metadata.csv", row.names=F) ; 
quit("no") ; 

### PASO 6 : cambiar nombre del OUTPUT ###
rm metadata_shiny.csv ; 
mv new_metadata.csv metadata_shiny.csv ; 
ls -lh ;

### PASO 7 : remover filas de "none" y "no asignados" , ###
### guardar y continuar con R ###

#####################################
########### TERCER SCRIPT : tabla en R ###########
#####################################

dir()

library(fossil)
library(tidyr)

data <- read.csv("metadata_shiny.csv", header=TRUE)
dim(data)
head(data)
sort(unique(data$lineage))

q <- data.frame(week=paste0(data$epi_week,"_",data$epi_year), lineage=data$lineage, abundance=rep(1,length(data$strain))) 
head(q)
dim(q)
df <- create.matrix(q, tax.name = "week",locality = "lineage", abund.col = "abundance", abund = TRUE)
class(df)
table <- as.data.frame(df)
dim(table)
head(table)
colu <- dim(table)[2]
rown <- dim(table)[1]

rs <- as.data.frame(rowSums(table[,1:colu])) 
rs
a <- cbind(table,total=rs)
dim(a)
cs <- t(as.data.frame((colSums(a[,1:(colu+1)]))))
cs
b <- rbind(a,cs)
names(b) <- c(names(b)[1:colu],"total")
names <- c(row.names(b)[1:rown],"total")
d <- data.frame(semana=names,b)
head(d)

f <- separate(d,"semana",c("week","year"),sep="[_]")
head(f)
f$week <- as.numeric(f$week)
g <- f[order(f$year,f$week),]
head(g)
write.csv(g,"complete_table.csv", row.names=FALSE)

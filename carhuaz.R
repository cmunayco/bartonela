### set the directory
#setwd("C:\\Users\\Jackeline\\Documents\\Base_bartonella.csv")
#getwd()
library(plyr)
library(ggplot2)
datos.excel=data.frame(read.csv("base de bartonella.csv"))
head(datos.excel)
#new_data = arrange(datos.excel,ANO,DEPARTAM,DISTRITO)
#head(new_data)
#new_data$ANO = factor(new_data$ANO)  #as.numeric
#años = levels(new_data$ANO)
#for (i in años){
#  dataporano = subset(datos.excel, ANO == i )
#  write.csv(dataporano,paste("archivo",i,".csv",sep=""))
#}

#CODIGO SOLO PARA CASO CARHUAZ
### Inicia aqui ..................................................
###...............................................................
library(plyr)
library(ggplot2)

datos.excel=data.frame(read.csv("base de bartonella.csv"))
View(datos.excel)
head(datos.excel)

new_data <- subset(datos.excel, DISTRITO == "CARHUAZ")
new_data$ANO = factor(new_data$ANO)# convierte los años a factor 
new_data$SEMANA = factor(new_data$SEMANA)
new_data$UBIGEO = factor(new_data$UBIGEO)
head(new_data)
summary(new_data)

tablaepi=data.frame(read.csv("tablaepi.csv")) # 
head(tablaepi)

df1 = tablaepi[,c(1,2,3)]
df2 = new_data[,c(1,2,8,9,10)]
Carhuazdata = merge(x = df1, y = df2, by = c("AÑO","SEMANA"), all.x=TRUE)#Union
Carhuazdata[is.na(Carhuazdata)] <- 0
head(Carhuazdata)
Carhuazdata$DEPARTAM = rep("ANCASH",(dim(Carhuazdata)[1]))#agregar departamento 
Carhuazdata$X = factor(paste(Carhuazdata$ANO,Carhuazdata$SEMANA,sep="")) #une dos columnas
###plot(x=Carhuazdata$X,y=Carhuazdata$Total,main="d")
###lines(Carhuazdata$X,Carhuazdata$Total)
### FIN ............................................................
###.................................................................
Año = c()
Semana <- c()
year<-c(2000:2014)
weak<-c(1:53)
for (i in year){
  Año = c(Año,rep(i,53))
  Semana <- c(Semana,weak)
}
epitabla<-data.frame(Año,Semana) 
View(epitabla)
epitabla$Año<-factor(epitabla$Año)
epitabla$Semana<-factor(epitabla$Semana)
summary(epitabla)

colnames(epitabla)<- c("ANNIO","SEMANA")
datos.excel$ANNIO<-factor(datos.excel$ANNIO)
datos.excel$SEMANA<-factor(datos.excel$SEMANA)
merged.data<-merge(epitabla,datos.excel,by=c("ANNIO","SEMANA"),all.x=TRUE)
View(merged.data)
#write.csv(merged.data,"datos.csv")
###.................................................................
###.................................................................

  
new_data <- subset(datos.excel, DISTRITO == "CARHUAZ" & ANO == 2000 )
new_data = arrange(datos.excel,ANO,DEPARTAM,DISTRITO)# usar para caso general
# m <- matrix(sample(c(NA, 1:10), 100, replace = TRUE), 10)

df1 = tabla1
df2 = new_data[,c(2,8,9,10)]
merge(x = df1, y = df2, by = "SEMANA", all.x=TRUE)


# d <- as.data.frame(m)
# data.matrix()
# x <. data.frame(too =1:4, bar = c(T,T,F,F))
# X

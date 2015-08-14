
##### data management 

datos.excel=data.frame(read.csv("base de bartonella.csv"))

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

write.csv(merged.data,"bartonela_1.csv")


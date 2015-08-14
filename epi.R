#rm(list=ls())
epical <- function(año1 = 2000, año2 = 2014){
  Año = c()
  Semana <- c()
  year<-c(año1:año2)
  #seq(2,10,by=)
  weak<-c(1:52)
  for (i in year){
    Año = c(Año,rep(i,52))   
    Semana <- c(Semana,weak)
  }
  epitabla<-data.frame(Año,Semana) 
  epitabla$Año<-factor(epitabla$Año)
  return(epitabla)
}
#epical()

getdepa <- function(file="bartonela_1.csv",departamento){
  datos.excel=data.frame(read.csv(file))
  new_data <- subset(datos.excel, DEPARTAM == departamento)
  new_data$ANNIO = factor(new_data$ANNIO)# convierte los años en factor 
  new_data$SEMANA = factor(new_data$SEMANA)# convierte las semanas en factor 
  new_data$UBIGEO = factor(new_data$UBIGEO)# convierte los ubigeos en factor 
  return(new_data)  
}
##
getprovi <- function(file="base de bartonella.csv",provincia){
  datos.excel=data.frame(read.csv(file))
  new_data <- subset(datos.excel, PROVINCIA == provincia)
  new_data$AÑO = factor(new_data$AÑO)# convierte los años en factor 
  new_data$SEMANA = factor(new_data$SEMANA)# convierte las semanas en factor 
  new_data$UBIGEO = factor(new_data$UBIGEO)# convierte los ubigeos en factor 
  return(new_data)  
}
##

getconfirmado <-function(file="bartonela_1.csv",numin=3,año){
  datos.excel=data.frame(read.csv(file))
  new_data<-subset(datos.excel,Total >= numin & ANNIO == año)
  departamentos=factor(new_data$DEPARTAM)
  return(levels(departamentos))
}



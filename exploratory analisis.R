####### data analysis #########
library(epicalc)
library(reshape)
library(reshape2)
library(plyr)
library(lattice)
library(Hmisc)
library(plm)
library(car)



bartonela_1<-read.csv("bartonela_1.csv")

sapply(bartonela_1$Total, sum, na.rm=TRUE)

attach(bartonela_1)

aggdata1 <-as.data.frame(aggregate(bartonela_1$Total, by=list(ANNIO,DEPARTAM), 
                    FUN=sum, na.rm=TRUE))
print(aggdata1)

aggdata2 <-aggregate(bartonela_1$Total, by=list(DEPARTAM,PROVINCIA), 
                    FUN=sum, na.rm=TRUE)
print(aggdata2)

quartz(width=8, height=6, pointsize=9)
with(subset(aggdata1,aggdata1$Group.2=="AMAZONAS"), 
     plot(Group.1,x,col="blue", main="", xlab="Years", ylab="Frecuencia"))

quartz(width=8, height=6, pointsize=9)
with(subset(aggdata1,aggdata1$Group.2=="ANCASH"), 
     plot(x,col="blue", main="", xlab="Years", ylab="Frecuencia"))


quartz(width=8, height=6, pointsize=9)
xyplot(x ~ Group.1 | Group.2, data=aggdata1, 
                             col="blue", main="", xlab="Years", ylab="Frecuencia")




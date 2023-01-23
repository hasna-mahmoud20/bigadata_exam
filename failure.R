library(ggplot2)
library(dplyr)
library(viridis)
library(hrbrthemes)
library(tidyverse)
library(scales)
#install.packages("viridis")
#install.packages("hrbrthemes")


smart_predictive <- read.csv("C:\\Users\\AdMin\\Desktop\\Nouveau dossier (2)\\predictive_maintenance.csv")

datafailure=dplyr::select(filter(smart_predictive,FailureType == "No Failure"),Type,FailureType)
datafailure
  mydataailure<-datafailure %>% count(Type) %>%
    arrange(desc(Type))%>%
    mutate(percentagFailure=n/sum(n) *100,
           pos_pie=round(cumsum(percentagFailure)-0.5 * percentagFailure,2))

plot1<-function(){
  ggplot(data= mydataailure)+
    geom_col(mapping = aes(x="",y= percentagFailure,fill=Type))+
    coord_polar(theta="y")+
    geom_text(aes(x="",y=pos_pie,label=scales::percent(percentagFailure,scale=1)))+theme_classic()+theme_minimal()
  
}

plot1()

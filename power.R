library(ggplot2)
library(dplyr)
library(viridis)
library(hrbrthemes)
library(tidyverse)
library(scales)
#install.packages("viridis")
#install.packages("hrbrthemes")


smart_predictive <- read.csv("C:\\Users\\AdMin\\Desktop\\Nouveau dossier (2)\\predictive_maintenance.csv")

datafailurePower=dplyr::select(filter(smart_predictive,FailureType == "Power Failure"),Type,FailureType)
mydataFailurePower<-datafailurePower %>% count(Type) %>%
  arrange(desc(Type))%>%
  mutate(percentagPower=n/sum(n) *100,
         pos_pie=round(cumsum(percentagPower)-0.5 * percentagPower,2))

plot2<-function(){
  ggplot(data= mydataFailurePower)+
    geom_col(mapping = aes(x="",y= percentagPower,fill=Type))+
    coord_polar(theta="y")+
    geom_text(aes(x="",y=pos_pie,label=scales::percent(percentagPower,scale=1)))+theme_classic()+theme_minimal()
  
}


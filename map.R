library("tidyverse")


library(leaflet)



content <- paste(sep = "<br/>",
                 "<b>Farm Uncle Moussa </b>",
                 "Biougra"
)
carte<-function(){
  leaflet() %>% 
    setView(-9.370152 ,30.22,15) %>% 
    addTiles() %>% 
    addPopups(-9.370152, 30.22, content,
              options = popupOptions(closeButton = FALSE)
    )
  
}

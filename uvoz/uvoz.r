# 2. faza: Uvoz podatkov
library(readr)
library(reshape2)
library(dplyr)

#sl <- locale("sl", decimal_mark="", grouping_mark="")

# številke stolpcev 2,3,5,11,13,16,17
# colnames(tabela) <- ("datum", "drzava", "povzrocitelj", "zrtve", "tarca", "regija", "tip napada")

K <- read_csv("podatki/GTD-Export.csv", 
               na="", locale=locale(encoding="Windows-1250", 
                                           #decimal_mark = ".",
                                           #grouping_mark = ""
                                           )
              )  

#izpuščeni stolpci columns(tabela) - c(1,4,6,7,8,9,10,12,14,15,18,19,20,21,22,23)
K.brez <- K[c(-1,-4,-6,-7,-8,-9,-10,-12,-14,-15,-18,-19,-20,-21,-22,-23)]
K %>% select("DATE", "COUNTRY")

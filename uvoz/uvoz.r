# 2. faza: Uvoz podatkov
library(readr)
library(reshape2)
library(dplyr)

#sl <- locale("sl", decimal_mark="", grouping_mark="")

# številke stolpcev 2,3,5,11,13,16,17
# colnames(tabela) <- ("datum", "drzava", "povzrocitelj", "zrtve", "tarca", "regija", "tip napada")

podatki_napadi <- read_csv("podatki/terrorist-incidents.csv", 
               na="", locale=locale(encoding="Windows-1250"),skip=1, col_names=c("drzava", "koda", "leto", "stevilo")
                                                          )

podatki_napadi$koda <- NULL

podatki_zrtve <- read_csv("podatki/fatalities-from-terrorism.csv", 
                          na="", locale=locale(encoding="Windows-1250"),skip=1, col_names=c("drzava", "koda", "leto", "zrtve")
)  
podatki_zrtve$koda <- NULL

podatki_poskodbe <- read_csv("podatki/injuries-from-terrorism.csv", 
                             na="", locale=locale(encoding="Windows-1250"),skip=1, col_names=c("drzava", "koda", "leto", "poskodbe")
)  
podatki_poskodbe$koda <- NULL


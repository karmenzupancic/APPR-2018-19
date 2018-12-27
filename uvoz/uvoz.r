# 2. faza: Uvoz podatkov

sl <- locale("sl", decimal_mark=",", grouping_mark=".")

# #regije <- ("Australasia & Oceania", "Central America & Caribbean", "Central Asia"
#            East Asia
#            Eastern Europe
#            Middle East & North Africa
#            North America
#            South America
#            South Asia
#            Southeast Asia
#            Sub-Saharan Africa
#            Western Europe)
# 

T <- read_csv("GTDdata.csv", col_names=c(regije),
              skip=1, na="", locale=locale(encoding="Windows-1250", 
                                           decimal_mark = "",
                                           grouping_mark = "."),
              n_max = 14)  

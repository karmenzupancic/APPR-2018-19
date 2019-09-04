# 3. faza: Vizualizacija podatkov

#graf svetovni napadi
graf.svetovni.napadi <- ggplot(podatki_napadi %>% filter(drzava == "World")) + aes(x=leto, y=stevilo, group=drzava)+ geom_point() + geom_line() + theme(panel.grid.major.y =element_line(color="red"))

#graf evropski napadi
graf.evropa.napadi <- ggplot(podatki_napadi %>% filter(drzava %in% c("Western Europe", "Eastern Europe"))) + aes(x=leto, y=stevilo, group=drzava, color=drzava) + geom_line()

#graf napadov v iraqu
graf.iraq.napadi <- ggplot(podatki_napadi %>% filter(drzava == "Iraq")) + aes(x=leto, y=stevilo, group=drzava) + geom_line() + geom_smooth()


#graf procenti drzav Bliznjega vzhoda
pomozna_tabela1 <- podatki_napadi %>% filter(drzava == "World")
pomozna_tabela1$drzava <- NULL
names(pomozna_tabela1)[names(pomozna_tabela1)=="stevilo"] <- "stevilo_svet"

pomozna_tabela1 <- right_join(pomozna_tabela1, podatki_napadi %>% filter(drzava == "Middle East & North Africa"))


pomozna_tabela1$drzava <- NULL
names(pomozna_tabela1)[names(pomozna_tabela1)=="stevilo"] <- "stevilo_vzhod"

pomozna_tabela1 <- mutate(pomozna_tabela1, delez = stevilo_vzhod / stevilo_svet)

graf.vzhod.delez <- ggplot(pomozna_tabela1) + aes(x=leto, y=delez, group=TRUE) + geom_area(fill="red")


#graf procenti zahodno Evropskih drzav
pomozna_tabela2 <- podatki_napadi %>% filter(drzava == "World")
pomozna_tabela2$drzava <- NULL
names(pomozna_tabela2)[names(pomozna_tabela2)=="stevilo"] <- "stevilo_svet"

pomozna_tabela2 <- right_join(pomozna_tabela2, podatki_napadi %>% filter(drzava == "Western Europe"))


pomozna_tabela2$drzava <- NULL
names(pomozna_tabela2)[names(pomozna_tabela2)=="stevilo"] <- "stevilo_evropa"

pomozna_tabela2 <- mutate(pomozna_tabela2, delez = stevilo_evropa / stevilo_svet)

graf.evropa.delez <- ggplot(pomozna_tabela2) + aes(x=leto, y=delez, group=TRUE) + geom_area(fill="red")


#graf žrtev proti poškodovanim

tabela_zrtev_poskodovanih <-right_join(podatki_poskodbe, podatki_zrtve)

graf_zrtev_poskodovanih_evropa <- ggplot(tabela_zrtev_poskodovanih %>% filter(drzava == "Western Europe")) + aes(x=zrtve, y=poskodbe, color=leto) + geom_point() + geom_smooth(method="lm", formula=y~log(x))

graf_zrtev_poskodovanih_vzhod <- ggplot(tabela_zrtev_poskodovanih %>% filter(drzava == "Middle East & North Africa")) + aes(x=zrtve, y=poskodbe, color=leto) + geom_point() + geom_smooth()



# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/110m_cultural.zip",
                             "ne_110m_admin_0_countries", encoding="UTF-8") %>% fortify
slikazemljevid <- ggplot(zemljevid) + 
  geom_polygon(aes(x = long, y = lat, group=group)) 



# 3. faza: Vizualizacija podatkov

#graf svetovni napadi
graf.svetovni.napadi <- ggplot(podatki_napadi %>% filter(drzava == "World")) + aes(x=leto, y=stevilo, group=drzava)+ geom_point() + geom_line() + theme(panel.grid.major.y =element_line(color="red"))

#graf evropski napadi
graf.evropa.napadi <- ggplot(podatki_napadi %>% filter(drzava %in% c("Western Europe", "Eastern Europe"))) + aes(x=leto, y=stevilo, group=drzava) + geom_line(color="red")

#graf napadov v iraqu
graf.iraq.napadi <- ggplot(podatki_napadi %>% filter(drzava == "Iraq")) + aes(x=leto, y=stevilo, group=drzava) + geom_line() + geom_smooth()


#graf procenti drzav Bliznjega vzhoda
pomozna_tabela1 <- podatki_napadi %>% filter(drzava == "World")
pomozna_tabela1$drzava <- NULL
names(pomozna_tabela1)[names(pomozna_tabela1)=="stevilo"] <- "stevilo_svet"

pomozna_tabela1 <- right_join(pomozna_tabela1, podatki_napadi %>% filter(drzava == "Middle East & North Africa"))


pomozna_tabela1$drzava <- NULL
names(pomozna_tabela1)[names(pomozna_tabela1)=="stevilo"] <- "stevilo_vzhod"

pomozna_tabela1 <- mutate(pomozna_tabela1, procent = stevilo_vzhod / stevilo_svet)

graf.vzhod.procenti <- ggplot(pomozna_tabela1) + aes(x=leto, y=procent, group=TRUE) + geom_line() + geom_area()


#graf procenti zahodno Evropskih drzav
pomozna_tabela2 <- podatki_napadi %>% filter(drzava == "World")
pomozna_tabela2$drzava <- NULL
names(pomozna_tabela2)[names(pomozna_tabela2)=="stevilo"] <- "stevilo_svet"

pomozna_tabela2 <- right_join(pomozna_tabela2, podatki_napadi %>% filter(drzava == "Western Europe"))


pomozna_tabela2$drzava <- NULL
names(pomozna_tabela2)[names(pomozna_tabela2)=="stevilo"] <- "stevilo_evropa"

pomozna_tabela2 <- mutate(pomozna_tabela2, procent = stevilo_evropa / stevilo_svet)

graf.evropa.procenti <- ggplot(pomozna_tabela2) + aes(x=leto, y=procent, group=TRUE) + geom_line() + geom_area()


#graf žrtev proti poškodovanim

tabela_zrtev_poskodovanih <-right_join(podatki_poskodbe, podatki_zrtve)

graf_zrtev_poskodovanih <- ggplot(tabela_zrtev_poskodovanih %>% filter(drzava %in% c("Iraq", "Western Europe", "Eastern Europe"))) + aes(x=zrtve, y=poskodbe, color=drzava) + geom_point()



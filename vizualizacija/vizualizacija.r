# 3. faza: Vizualizacija podatkov

#graf svetovni napadi
graf.svetovni.napadi <- ggplot(podatki_napadi %>% filter(drzava == "World")) + aes(x=leto, y=stevilo, group=drzava)+ geom_point() + geom_line()

#graf procenti iraqa
pomozna_tabela1 <- podatki_napadi %>% filter(drzava == "World")
pomozna_tabela1$drzava <- NULL
names(pomozna_tabela1)[names(pomozna_tabela1)=="stevilo"] <- "stevilo_svet"

pomozna_tabela1 <- right_join(pomozna_tabela1, podatki_napadi %>% filter(drzava == "Iraq"))


pomozna_tabela1$drzava <- NULL
names(pomozna_tabela1)[names(pomozna_tabela1)=="stevilo"] <- "stevilo_iraq"

pomozna_tabela1 <- mutate(pomozna_tabela1, procent = stevilo_iraq / stevilo_svet)

graf.iraq.procenti <- ggplot(pomozna_tabela1) + aes(x=leto, y=procent, group=TRUE) + geom_point() + geom_line()

#graf žrtev proti poškodovanim

tabela_zrtev_poskodovanih <-right_join(podatki_poskodbe, podatki_zrtve)

graf_zrtev_poskodovanih <- ggplot(tabela_zrtev_poskodovanih %>% filter(drzava %in% c("Iraq", "Western Europe", "Eastern Europe"))) + aes(x=zrtve, y=poskodbe, color=drzava) + geom_point()



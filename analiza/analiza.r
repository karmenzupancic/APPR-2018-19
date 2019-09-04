# 4. faza: Analiza podatkov

podatki <- right_join(podatki_napadi, podatki_poskodbe)
podatki <- right_join(podatki, podatki_zrtve)
podatki <- filter(podatki, leto==2017)

vektor <- c("South Asia", "South America", "Western Europe", "World", "Western Sahara", "Sub-Saharan Africa","Southeast Asia", "North America","Middle East & North Africa", "Eastern Europe", "East Asia", "Central America & Caribbean",  "Central Asia", "Australasia & Oceania")
i <- 1
while (i<=length(vektor)) {
  podatki <- filter(podatki, drzava != vektor[i])
  i <- i +1
}

podatki$drzava <- gsub("United States", "United States of America",podatki$drzava)
podatki$drzava <- gsub("Tanzania", "United Republic of Tanzania",podatki$drzava)
podatki$drzava <- gsub("Democratic Republic of Congo", "Democratic Republic of the Congo",podatki$drzava)
podatki$drzava <- gsub("Czech Republic", "Czechia",podatki$drzava)
podatki$drzava <- gsub("Cote d'Ivoire", "Ivory Coast",podatki$drzava)
podatki$drzava <- gsub("Serbia", "Republic of Serbia",podatki$drzava)

podatki$leto <- NULL
row.names(podatki) <- podatki$drzava
podatki$drzava <- NULL
podatki.norm <- podatki %>% scale()


k <- kmeans(podatki.norm, 5, nstart=1000)
skupine <- data.frame(drzave=row.names(podatki.norm), skupine=factor(k$cluster))
zemljevid_sveta <- ggplot(right_join(zemljevid,skupine, by=c("SOVEREIGNT"="drzave"))) + geom_polygon() + 
  aes(x=long, y=lat, group=group, fill=skupine) + xlab("") + ylab("") + theme_minimal()

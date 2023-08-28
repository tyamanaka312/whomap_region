library('devtools')

library("ggplot2")
library("dplyr")
library("devtools")
library('here')
library('RColorBrewer')

library('xlsx')
library("whomap")

install_github("glaziou/whomap")

tb <- read.csv("https://extranet.who.int/tme/generateCSV.asp?ds=notifications") 

df <- tb %>%
  filter(year==2021) %>%
  select(iso3,c_newinc,g_whoregion) %>%
  mutate(var = cut(c_newinc,breaks=c(0,100,1000,10000,100000,Inf),right = FALSE, 
                   labels=c("<100","100\u2013999","1000\u20139999","10000\u201399999","\u2265100000"))) 

p1 <-  whomap(df,
              colours = brewer.pal(5, "YlGnBu"), # using a prefixed colour pattern: for other patterns. please see https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
              legend.title = "New/relapse TB cases", # legend title
              na.col = "white", # colour for NA values
              water.col = "white", # colour for sea area: default is skyblue
              legend.pos = c(0.14,0.40)) # legend position

install_github('tyamanaka312/whomap_region')
library("whoregionalmap")

zoom <- "WPR"
p1 <- df %>%
  # filter(g_whoregion == zoom) %>%
  whomap_region(
       colours = brewer.pal(5, "YlGnBu"), # using a prefixed colour pattern: for other patterns. please see https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
       legend.title = "New/relapse TB cases", # legend title
       na.col = "grey", # colour for NA values
       water.col = "white", # colour for sea area: default is skyblue
       legend.pos = c(0.14,0.40),
       zoom = zoom) # legend position

ggsave(p1, file=here::here("./tests/local/test_output.png"),width=12,height=8) # file extension can be:device function "png","eps", "ps", "tex" (pictex), "pdf", "jpeg", "tiff", "png", "bmp", "svg" or "wmf" (windows only). 
















if (!is.factor(df$g_whoregion))
  df$g_whoregion <- as.factor(df$g_whoregion)

toplot <-merge(gworld,
      df,
      by.x = 'id',
      by.y = 'iso3',
      all.x = TRUE)

toplot <- toplot[order(toplot$order),]

levels(toplot$g_whoregion) <-
  c(levels(toplot$g_whoregion), 'Not applicable')
levels(toplot$var) <-
  c(levels(toplot$var), 'No data', 'Not in region', 'Not applicable')
toplot[toplot$id == "ESH", "var"] <- 'Not applicable'
toplot[is.na(toplot$g_whoregion), "g_whoregion"] <- 'Not applicable'
toplot[toplot$g_whoregion != "WPR", "var"] <- 'Not in region'

df %>%
  filter(g_whoregion == zoom)
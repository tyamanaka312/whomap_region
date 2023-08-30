library('devtools')
library("ggplot2")
library("dplyr")
library("devtools")
library('here')
library('RColorBrewer')
library('xlsx')

# test data: Global TB database
tb <- read.csv("https://extranet.who.int/tme/generateCSV.asp?ds=notifications") 

df <- tb %>%
  filter(year==2021) %>%
  select(iso3,c_newinc,g_whoregion) %>%
  mutate(var = cut(c_newinc,breaks=c(0,100,1000,10000,100000,Inf),right = FALSE, 
                   labels=c("<100","100\u2013999","1000\u20139999","10000\u201399999","\u2265100000"))) 

devtools::install_github('tyamanaka312/whomap_region')
library("whoregionalmap")

# WHO AFRO
AFR <- df %>%
  whomap_region(
       colours = brewer.pal(5, "YlGnBu"), # using a prefixed colour pattern: for other patterns. please see https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
       legend.title = "New/relapse TB cases", # legend title
       na.col = "white", # colour for NA values
       water.col = "white", # colour for sea area: default is skyblue
       zoom = "AFR") # must specify WHO region code "AFR", "AMR", "EUR", "EMR", "SEA", "WPR" are allowed.

ggsave(AFR, file=here::here("./tests/local/AFR.png"),width=8,height=10) 

# WHO AMRO/PAHO
AMR <- df %>%
  whomap_region(
    colours = brewer.pal(5, "YlGnBu"), # using a prefixed colour pattern: for other patterns. please see https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
    legend.title = "New/relapse TB cases", # legend title
    na.col = "white", # colour for NA values
    water.col = "white", # colour for sea area: default is skyblue
    zoom = "AMR") # must specify WHO region code

ggsave(AMR, file=here::here("./tests/local/AMR.png"),width=8,height=12) 


# WHO EURO
EUR <- df %>%
  whomap_region(
    colours = brewer.pal(5, "YlGnBu"), # using a prefixed colour pattern: for other patterns. please see https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
    legend.title = "New/relapse TB cases", # legend title
    na.col = "white", # colour for NA values
    water.col = "white", # colour for sea area: default is skyblue
    zoom = "EUR") # must specify WHO region code

ggsave(EUR, file=here::here("./tests/local/EUR.png"),width=14,height=10) 

# WHO EMRO
EMR <- df %>%
  whomap_region(
    colours = brewer.pal(5, "YlGnBu"), # using a prefixed colour pattern: for other patterns. please see https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
    legend.title = "New/relapse TB cases", # legend title
    na.col = "white", # colour for NA values
    water.col = "white", # colour for sea area: default is skyblue
    zoom = "EMR") # must specify WHO region code

ggsave(EMR, file=here::here("./tests/local/EMR.png"),width=12,height=8) 


# WHO SEARO
SEA <- df %>%
  whomap_region(
    colours = brewer.pal(5, "YlGnBu"), # using a prefixed colour pattern: for other patterns. please see https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
    legend.title = "New/relapse TB cases", # legend title
    na.col = "white", # colour for NA values
    water.col = "white", # colour for sea area: default is skyblue
    zoom = "SEA") # must specify WHO region code

ggsave(SEA, file=here::here("./tests/local/SEA.png"),width=12,height=8) 

# WHO WPRO
WPR <- df %>%
  whomap_region(
    colours = brewer.pal(5, "YlGnBu"), # using a prefixed colour pattern: for other patterns. please see https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
    legend.title = "New/relapse TB cases", # legend title
    na.col = "white", # colour for NA values
    water.col = "white", # colour for sea area: default is skyblue
    zoom = "WPR") # must specify WHO region code

ggsave(WPR, file=here::here("./tests/local/WPR.png"),width=12,height=8) 



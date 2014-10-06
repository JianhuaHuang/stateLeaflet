library(leaflet)
library(RColorBrewer)
library(maps)
library(rjson)
library(ggplot2)
rm(list = ls())
# jsonFile <- 'C:/Users/temp/Dropbox/test/shiny/leafletState/states.JSON.txt'
# statesJson <- fromJSON(file = jsonFile)

states <- map("state", plot=FALSE, fill=TRUE)
states$names <- gsub(':', '.', states$names )

# states$names <- gsub('://D+', '', states$names )
statesDF <- fortify(states, region = 'id')

# split state in advance, then it doesn't need to subset the highlighted state
# every time. The speed will increase
eachState <- split(statesDF, statesDF$region)
# grep(strsplit('washington.main', '.', fixed = T)[[1]][1], names(eachState))


# head(statesDF)

# statesDF <- map_data('state')
# VG <- statesDF[statesDF$region == 'virginia', ]

# statesName <- unique(statesDF$region)
# statesDF$region[!duplicated(statesDF$region)]

# statesDF <- states
# 
# states[duplicated(states), ]
# states[duplicated(states[, -4]), ] <- NA
# 
# states <- list(x = states$long, y = states$lat, 
#   names = unique(na.omit(states$region)))


# data(state.fips)
# state.fips
# 
# 
# data(state.fips)
# state.fips$polyname <- gsub('://D+', '', state.fips$polyname)
# st.abb <- unique(state.fips[,c('fips','abb', 'polyname')])

# states[c(1,202),]
# statemap <- map('state', plot = F, fill = T)
# length(statemap$x)
# statemap$x[c(1,202)]
# statemap$x
# states$names

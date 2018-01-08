library(plyr)
indat<-read.csv("/Users/weiyeyao/Documents/incubator/realtime.csv")

indat$vehicle_id<-as.factor(indat$vehicle_id)
indat$trip_id <- as.factor(indat$trip_id)

deduped.data <-unique(indat[c(3, 9)])
numTrips <- count(deduped.data$vehicle_id)
median(numTrips$freq)

deduped.data$route <- as.character(deduped.data$trip_id) 
deduped.data$route2 <- strsplit(deduped.data$route, '_')
deduped.data$route5 <- do.call(rbind,deduped.data$route2)[,3]
deduped.data$route5 <- as.factor(deduped.data$route5)
numTrips_M <- count(deduped.data$route5)


indat$route <- do.call(rbind, strsplit(as.character(indat$trip_id), '_'))[,3]
datM <- subset(indat, grepl('M', indat$route) & indat$route!= 'MISC')
datM116 <- subset(datM, grepl('M116', datM$route))
datM116_initial <- subset(datM116, datM116$next_stop_id == 401998 )
lateness = c(209, 97, 47, -36, 34, 13)
var(lateness)/3600

deduped.data2<-unique(indat[c(9, 11)])
summary(indat$next_stop_id)
2420/1334956

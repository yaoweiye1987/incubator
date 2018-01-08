indat<-read.csv("/Users/weiyeyao/Documents/incubator/rows.csv")
df <- as.data.frame(indat)
prop.table(df$Agency)
summary(df$Agency)
344067/1995812
df$Latitude[is.na(df$Latitude)] <- median(df$Latitude, na.rm=T)
df$Longitude[is.na(df$Longitude)] <- median(df$Longitude, na.rm=T)
quantile(df$Latitude, c(.90, .10)) 
40.85071-40.62305
sd(df$Latitude)
mean(df$Latitude)
sd(df$Longitude)
mean(df$Longitude)
a = 6371*pi * sd(df$Latitude)/180 
b = pi * sd(df$Longitude)/180 *6371*cos(mean(df$Latitude)/180*pi)
area = pi* a * b

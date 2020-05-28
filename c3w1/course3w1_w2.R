#course3 w1 q1
setwd("/Users/lulu/R_Coursera/R_Programming/c3w1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "c3w1.csv", method = "curl")
dateDownloaded <- date()
c3w1 <- read.csv("c3w1.csv")
n <- nrow(c3w1[c3w1$VAL==24&!is.na(c3w1$VAL),])
n


#course3 w1 q3
setwd("/Users/lulu/R_Coursera/R_Programming/c3w1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "natural_gas.xlsx", method = "curl")
dateDownloaded <- date()
dat <- read.xlsx("natural_gas.xlsx", cols=7:15, rows=18:23)
sum(dat$Zip*dat$Ext,na.rm=T)

#course3 w1 q4
setwd("/Users/lulu/R_Coursera/R_Programming/c3w1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl, destfile = "restaurants.xml", method = "curl")
dateDownloaded <- date()
doc <- xmlTreeParse("restaurants.xml", useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
zip <- xpathSApply(rootNode, "//zipcode", xmlValue)
sum(as.numeric(zip) == 21231)

#course3 w1 q5
setwd("/Users/lulu/R_Coursera/R_Programming/c3w1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "housing.csv", method = "curl")
dateDownloaded <- date()
library(data.table)
DT <- fread("housing.csv")
system.time(DT[,mean(pwgtp15),by=SEX])

#course3 w1 q5
setwd("/Users/lulu/R_Coursera/R_Programming/c3w1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "housing.csv", method = "curl")
dateDownloaded <- date()
DT <- fread("housing.csv")
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

#course3 w2 q5
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode = readLines(con)
lapply(htmlcode[c(10, 20, 30, 100)], nchar)

#course3 w2 q6
setwd("/Users/lulu/R_Coursera/R_Programming/c3w1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl, destfile = "wksst8110.for", method = "curl")
dateDownloaded <- date()
data <- read.fwf("wksst8110.for",c(-28,4), skip = 4)
sum(data)


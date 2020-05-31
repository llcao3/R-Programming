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

#course3 w3 q1
setwd("/Users/lulu/R_Coursera/R_Programming/c3w1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "housing_Idaho.csv", method = "curl")
dateDownloaded <- date()
DT <- fread("housing_Idaho.csv")
agricultureLogical <- DT$ACR==3 & DT$AGS==6
which(agricultureLogical)

#course3 w3 q2
setwd("/Users/lulu/R_Coursera/R_Programming/c3w1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, destfile = "Fjeff.jpg", method = "curl")
dateDownloaded <- date()
library(jpeg)
DT <- readJPEG("Fjeff.jpg", native=TRUE)
quantile(DT,probs=c(0.3,0.8))

#course3 w3 q3
setwd("/Users/lulu/R_Coursera/R_Programming/c3w1")
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1, destfile = "product.csv", method = "curl")
download.file(fileUrl2, destfile = "educational.csv", method = "curl")
dateDownloaded <- date()
DT1 <- read.csv("product.csv")
DT2 <- read.csv("educational.csv")
DT1 <- DT1%>% rename(rank=Gross.domestic.product.2012) %>% mutate(rank = as.numeric(as.character(rank))) %>% filter(!is.na(rank))
DT<- merge (DT1, DT2, by.x="X", by.y="CountryCode", all=FALSE)
DT_sorted <- DT %>% arrange(desc(rank))
DT_2 <- inner_join(DT1,DT2, by=c("X"="CountryCode"))
DT_2_sorted <- DT_2%>% arrange(desc(rank))
DT_sorted[13,"X.2"]
DT_2_sorted[13, "X.2"]

#course3 w3 q5

DT_sorted%>%group_by(Income.Group)%>%summarise(mean(rank))

#course3 w3 q5
setwd("/Users/lulu/R_Coursera/R_Programming/c3w1")
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1, destfile = "product.csv", method = "curl")
download.file(fileUrl2, destfile = "educational.csv", method = "curl")
dateDownloaded <- date()
DT1 <- read.csv("product.csv")
DT2 <- read.csv("educational.csv")
DT1 <- DT1%>% rename(rank=Gross.domestic.product.2012) %>% mutate(rank = as.numeric(as.character(rank))) %>% filter(!is.na(rank))
DT<- merge (DT1, DT2, by.x="X", by.y="CountryCode", all=FALSE)
DT_LMI <- DT%>%arrange(rank)%>%filter(Income.Group == "Lower middle income")%>%select(X)%>%mutate(as.character(X))
DT_highest <- DT%>%arrange(rank)%>%select(X)%>%mutate(as.character(X))
DT_highest38 <- DT_highest[1:38,]
DT_join <- inner_join(DT_LMI, DT_highest38)
str(DT_join)


# complete_full.R

setwd("/Users/lulu/R_Coursera/R_Programming/")
filenames <- list.files("specdata", full.names=TRUE)
temp <- lapply(filenames,function(i){
        read.csv(i, header=TRUE)
})
n1 <- sum(complete.cases(temp[[1]]))
df <- data.frame(1, n1)
names(df) <- c("id","nobs")
for (i in 2:332){
        ni <- sum(complete.cases(temp[[i]]))
        dfi <- data.frame(i,ni)
        names(dfi) <- c("id","nobs")
        df <- rbind(df,dfi)
}
df
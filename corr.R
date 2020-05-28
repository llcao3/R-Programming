# corr.R

setwd("/Users/lulu/R_Coursera/R_Programming/")
corr <- function(directory,threshold=0){
        filenames <- list.files(directory, full.names=TRUE)
        temp <- lapply(filenames,function(i){
                read.csv(i, header=TRUE)
        })
        corrs <- vector(mode="numeric",length=0L)
        for (i in 1:332){
                ni <- sum(complete.cases(temp[[i]]))
                if (ni > threshold){
                        dfi <- temp[[i]]
                        x <-dfi$nitrate
                        y <-dfi$sulfate
                        corri <- cor(x,y,use="pairwise.complete.obs", method = c("pearson"))
                        corrs <- c(corrs,corri)
                }
        }
        corrs
}
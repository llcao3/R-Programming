# complete.R

setwd("/Users/lulu/R_Coursera/R_Programming/")
complete <- function(directory,id){
        filenames <- list.files(directory, full.names=TRUE)
        temp <- lapply(filenames,function(i){
                read.csv(i, header=TRUE)
        })
        df <- data.frame(matrix(vector(), 0, 2, dimnames=list(c(), c("id", "nobs"))),stringsAsFactors=F)
        for (i in id){
                ni <- sum(complete.cases(temp[[i]]))
                dfi <- data.frame(i,ni)
                names(dfi) <- c("id","nobs")
                df <- rbind(df,dfi)
        }
        df
}
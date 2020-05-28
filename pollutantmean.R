# pollutantmean.R

setwd("/Users/lulu/R_Coursera/R_Programming/")
pollutantmean <- function(directory,pollutant,id=1:332){
        filenames <- list.files(path=directory, full.names=TRUE)
        temp <- lapply(filenames[id],function(i){
                read.csv(i, header=TRUE)
        })
        df <- do.call(rbind.data.frame, temp)
        colMeans(df[pollutant],na.rm=TRUE)
}
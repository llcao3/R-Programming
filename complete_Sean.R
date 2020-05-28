# complete.R

complete <- function(directory, id = 1:332) {
        file_names <- dir(directory, full.names = TRUE)
        nobs <- vector(mode = typeof(0), length = length(id))
        for (i in 1:length(id)) {
                all_cases <- read.csv(file_names[id[i]])
                # https://stat.ethz.ch/R-manual/R-patched/library/stats/html/complete.cases.html
                nobs[i] <- nrow(all_cases[complete.cases(all_cases), ])
        }
        data.frame(id, nobs)
}
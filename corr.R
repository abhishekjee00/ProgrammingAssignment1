corr <- function(directory, threshold = 1) {
  
  ret_value <- NULL

  good_rows <- complete("specdata",1:332)
  threshold_rows <- good_rows[good_rows$nobs > threshold,]
  
  if (nrow(threshold_rows) == 0) {
    return(NA)
  } 
  
  for (i in 1:nrow(threshold_rows)) {
    filename <- paste(getwd(),"/",directory,"/",sprintf("%03d",threshold_rows[i,"id"]),".csv", sep="")
    file_orig <- read.csv(filename)

    good <- complete.cases(file_orig)
    file_clean <- file_orig[good,]
    
    x <- cor(file_clean$sulfate,file_clean$nitrate)
    ret_value <- c(ret_value, x)
  }
  ret_value
}

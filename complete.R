complete <- function(directory, id = 1:332) {
  
  ret_value <- data.frame(id=NA, nobs=NA)[numeric(0),]
  for (file_id in id) {
    filename <- paste(getwd(),"/",directory,"/",sprintf("%03d",file_id),".csv", sep="")
    file <- read.csv(filename)
    
    good <- complete.cases(file)    
    new_row <- data.frame(id=file_id,nobs=nrow(file[good,]))
    ret_value <- rbind(ret_value,new_row)
  }
  ret_value
}

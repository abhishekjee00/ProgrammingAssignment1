pollutantmean <- function(directory, pollutant, id = 1:332) {

  init <- 1
  for (file_id in id) {
    filename <- paste(getwd(),"/",directory,"/",sprintf("%03d",file_id),".csv", sep="")
    file <- read.csv(filename)
    
    if (init == 1) {
      file_bind <- file
      init <- 2
    } else {
      file_bind <- rbind(file_bind,file)  
    }        
  }
  
    if (pollutant == "sulfate") {
      col_position <- 2
    } else if (pollutant == "nitrate") {
      col_position <- 3
    } else {
      return("Error in the pollutant value")
    }
    round(mean(file_bind[,col_position],na.rm=TRUE),3)
}



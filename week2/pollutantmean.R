pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  files = list.files(directory, full.names = TRUE)[id]
  
  tmp = data.frame()
  for (file in files) {
    file <- read.csv(file)
    tmp = rbind(tmp,file)
  }
  mean(tmp[,pollutant],na.rm = TRUE)
}
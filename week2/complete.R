complete <- function(directory, id = 1:332) {
  
  files = list.files(directory, full.names = TRUE)[id]
  
  tmp = data.frame()
  for (file in files) {
    file_content <- read.csv(file)
    id <- as.numeric(gsub("\\D", "", file)) 
    nobs <-  length(which(complete.cases(file_content)))
    row = cbind(id,nobs)
    tmp = rbind(tmp,row)
  }
  colnames(tmp) <- c("id","nobs")
  tmp
}
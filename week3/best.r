best <- function(state, outcome) {
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv")
  

  ## Check that state and outcome are valid
  if(! any(outcome == c("heart attack","heart failure","pneumonia"))){
    stop("invalid outcome")
  }
  if(! any(states == state)){
    stop("invalid state")
  }
  
  ## Return hospital name in that state with lowest 30-day death
  outcome_data <- outcome_data[which(outcome_data[,7]== state),]
  outcome_data <- outcome_data[outcome_data$State==state,]
  
  if( outcome == "heart attack"){
    ill <- 11
  }
  else if( outcome == "heart failure"){
    ill <- 17
  }
  else if( outcome == "pneumonia"){
    ill <- 23
  }
  
  outcome_data[, ill] <- as.double(outcome_data[, ill])
  all_min <- outcome_data[which(outcome_data[,ill] == min(outcome_data[,ill])),]  
  sorted_all_min <- all_min[order(all_min$Hospital.Name),]

  
  ## rate
  as.character(sorted_all_min[1,2])

}
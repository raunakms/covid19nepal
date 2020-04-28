### LOAD DATA: TOTAL ---
dat_total <- read.delim(file.dat_total, header=TRUE, stringsAsFactors=FALSE)
dat_total$date <- as.Date(dat_total$date, format = "%m/%d/%y")

### LOAD DATA: LABS ---
dat_labs <- read.delim(file.dat_labs, header=TRUE, stringsAsFactors=FALSE)
dat_labs$date <- as.Date(dat_labs$date, format = "%m/%d/%y")

### LOAD DATA: PATIENTS ---
dat_patients <- read.delim(file.dat_patients, header=TRUE, stringsAsFactors=FALSE)
dat_patients$date_confirmed <- as.Date(dat_patients$date_confirmed, format = "%m/%d/%y")	
dat_patients$date_recovered <- as.Date(dat_patients$date_recovered, format = "%m/%d/%y")	
dat_patients$date_death <- as.Date(dat_patients$date_death, format = "%m/%d/%y")

### LOAD METADATA: LABS ---
dat_metalabs <- read.delim(file.metadata_labs, header=TRUE, stringsAsFactors=FALSE)

### FUNCTION: num_changes() ---
num_changes <- function(x){
  y <- numeric()
  y[1] <- x[1]
  
  for(i in 2:length(x)){
    y[i] <- x[i] - x[i-1]           
  }
  
  return(y)
}  

### CALCULATE ACTIVE INFECTION, NEW TESTS, NEW POITIVES, NEW DEATH, NEW RECOVERED ---
dat_total$active_case <- dat_total$total_positive - dat_total$total_recovered
dat_total$new_tested <- num_changes(dat_total$total_test)
dat_total$new_positive <- num_changes(dat_total$total_positive)	
dat_total$new_death <- num_changes(dat_total$total_death)	
dat_total$new_recovered <- num_changes(dat_total$total_recovered)

### LATEST INFO ---
total_test <- dat_total$total_test[nrow(dat_total)]
total_positive <- dat_total$total_positive[nrow(dat_total)]
active_case <- dat_total$active_case[nrow(dat_total)]
total_recovered <- dat_total$total_recovered[nrow(dat_total)]
total_death <- dat_total$total_death[nrow(dat_total)]
rate_recovery <- round((total_recovered/total_positive) * 100,1)
rate_death <- round((total_death/total_positive) * 100, 1)


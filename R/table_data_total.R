dtbl <- dat_total %>%
          dplyr::select(Date=date, 
                'Total PCR Test'=total_test, 
                'Total Positive'=total_positive,
                'Active Cases'=active_case,
                'Total Recovered'=total_recovered,
                'Total Death'=total_death)

dtbl$Date <- as.Date(dtbl$Date, format = '%Y/%m/%d')

dtbl <- dtbl[order(dtbl$Date, decreasing = TRUE),]

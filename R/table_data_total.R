### DATA: TOTAL ----
dtbl <- dat_total %>%
          dplyr::select(Date=date, 
                'Total PCR Test'=total_test, 
                'Total Positive'=total_positive,
                'Active Cases'=active_case,
                'Total Recovered'=total_recovered,
                'Total Death'=total_death)

dtbl$Date <- as.Date(dtbl$Date, format = '%Y/%m/%d')

dtbl <- dtbl[order(dtbl$Date, decreasing = TRUE),]

### METADATA: LABS ---
d_metalabs <- dat_metalabs %>% 
                dplyr::select("Lab ID"=lab_id,
                              "Lab Name"=lab_name,
                              "City" =lab_city,
                              "District" =lab_district,
                              "Province" =lab_province)
  
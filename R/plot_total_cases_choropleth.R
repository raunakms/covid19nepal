#### Load Maps ---
geo <- geojsonio::geojson_read(file.geo, parse=TRUE, what="sp")
geo <- broom::tidy(geo, region="DISTRICT")


#### Frequency Table ---
dat_patients <- subset(dat_patients, !is.na(dat_patients$district))
dm <- dat_patients %>% 
  dplyr::count(district, sort=FALSE, name="Freq") %>%
  mutate(Percentage=(Freq/sum(Freq))*100) 

#### ADD CASE FREQ TO GEO OBJECT ---
d <- geo
d$ConfirmedCases <- 0
d$ConfirmedPercent <- 0

for(i in 1:nrow(dm)){
  index <- which(d$id == dm$district[i])
  d$ConfirmedCases[index] <- dm$Freq[i]
  d$ConfirmedPercent[index] <- dm$Percentage[i]
}

#### COMPUTE CLASS INTERVAL ---
d <- d %>% mutate(PatientGroup = cut(ConfirmedPercent, seq(0, 102, 3), include.lowest=FALSE))


#### Plot Choropleth Maps: Nepal with all Districts ---
map <- ggplot(data=d, aes(x=long, y=lat, group=group, fill=PatientGroup, text=paste("District: ", id, "\n", "Confirmed Cases: ", ConfirmedCases, "\n", sep=""))) +
        geom_path() +
        geom_polygon(aes(fill=PatientGroup), color="#000000") +
        scale_fill_brewer(palette = "Reds") +
        coord_equal() +
        theme_map() +
        theme(
          axis.text = element_blank(),
          axis.title = element_blank(),
          plot.title = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.ticks = element_blank(), 
          strip.text = element_blank(),
          strip.background = element_rect(fill="#d5e4eb", color="#d5e4eb"),
          panel.background = element_rect(fill="#d5e4eb", color="#d5e4eb"),
          plot.background = element_rect(fill = "#d5e4eb"),
          axis.line = element_blank(),
          legend.position = "none")
      #guides(fill=guide_legend(title="COVID-19 cases (in %)"))

p_total_cases_map <- map

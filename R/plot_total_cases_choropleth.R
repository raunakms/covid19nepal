#### Load Maps ---
geo <- geojsonio::geojson_read(file.geo, parse=TRUE, what="sp")
geo <- broom::tidy(geo, region="DISTRICT")


#### Frequency Table ---
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
d <- d %>% mutate(PatientGroup = cut(ConfirmedPercent, seq(0, 100, 5), include.lowest=FALSE))


#### Plot Choropleth Maps: Nepal with all Districts ---
map <- ggplot(data=d, aes(x=long, y=lat, group=group, fill=PatientGroup, text=paste("District: ", id, "\n", "Confirmed Cases: ", ConfirmedCases, "\n", sep=""))) +
        geom_path() +
        geom_polygon(aes(fill=PatientGroup), color="#000000") +
        scale_fill_brewer(palette = "Reds") +
        coord_equal() +
        theme_map() +
        theme(
          plot.title = element_text(size = 10, color="#000000", hjust=0.5),
          #aspect.ratio = 1,
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.ticks = element_blank(),	
          strip.text = element_text(size = 10, color="#000000", hjust=0.5),
          strip.background = element_rect(fill="#FFFFFF", color="#FFFFFF"),
          panel.background = element_rect(fill="#FFFFFF", color=NA),
          legend.text = element_text(size = 10, color="#000000"),
          legend.title = element_text(size = 10, color="#000000"),
          legend.key.size = unit(0.5, "cm"),
          legend.position = "none")
      #guides(fill=guide_legend(title="COVID-19 cases (in %)"))

p_total_cases_map <- map

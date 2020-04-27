d_agegrp <- dat_patients %>%
              tidyr::drop_na(age) %>%
              dplyr::mutate(AgeGroup = cut(age, seq(0, 100, 10), include.lowest=TRUE)) %>%
              dplyr::count(AgeGroup, sort=FALSE, name="Freq") %>%
              dplyr::mutate(Proportion= Freq/sum(Freq))

# PLOT ---
p1 <- ggplot(d_agegrp, aes(x=AgeGroup, y=Freq)) + 
        geom_bar(fill="#b15928", stat="identity", color=NA, width=0.8, size=0.5) +
        theme(
          axis.text.x = element_text(size = 15, color="#000000"),
          axis.text.y = element_text(size = 15, color="#000000"),
          axis.title = element_text(size = 15, color="#000000"),
          plot.title = element_text(size = 15, color="#000000", hjust=0.5),
          panel.grid.major.y = element_line(size=0.5, color="#BDBDBD"),
          panel.grid.minor.y = element_line(size=0.25, color="#BDBDBD"),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          axis.ticks = element_line(size=0.4, color="#000000"), 
          strip.text = element_text(size=10, color="#000000"),
          strip.background = element_rect(fill="#FFFFFF", color="#FFFFFF"),
          panel.background = element_rect(fill="#FFFFFF", color="#FFFFFF"),
          axis.line.x = element_line(size = 1.5, color="#000000"),
          axis.line.y = element_blank(),
          legend.text = element_text(size = 10, color="#000000"),
          legend.title = element_blank(),
          legend.key.size = unit(0.5, "cm"),
          legend.position = "none") +
        ylab("No. of COVID-19 patients") +
        xlab("Age Group (in years)") + 
        ggtitle("") 

p_agegroup_bar <- p1

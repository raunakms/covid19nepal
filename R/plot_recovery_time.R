### COMPUTE RECOVERY TIME ---
d_recov <- dat_patients %>%
              tidyr::drop_na(date_recovered) %>%
              dplyr::mutate(recovery_time=as.numeric(date_recovered - date_confirmed)+1)


# PLOT ---
p2 <- ggplot(d_recov, aes(x=recovery_time)) + 
        geom_histogram(fill="#33a02c", color="#FFFFFF", binwidth=5) +
        theme(
          axis.text.x = element_text(size = 15, color="#000000"),
          axis.text.y = element_text(size = 15, color="#000000"),
          axis.title = element_text(size = 15, color="#000000"),
          plot.title = element_text(size = 15, color="#000000", hjust=0.5),
          panel.grid.major.y = element_line(size=0.5, color="#FFFFFF"),
          panel.grid.minor.y = element_line(size=0.25, color="#FFFFFF"),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          axis.ticks = element_line(size=0.4, color="#FFFFFF"), 
          strip.text = element_text(size=10, color="#000000"),
          strip.background = element_rect(fill="#d5e4eb", color="#d5e4eb"),
          panel.background = element_rect(fill="#d5e4eb", color="#d5e4eb"),
          plot.background = element_rect(fill = "#d5e4eb"),
          axis.line.x = element_line(size = 1.5, color="#000000"),
          axis.line.y = element_blank(),
          legend.background = element_rect(fill="#d5e4eb"),
          legend.text = element_text(size = 12, color="#000000"),
          legend.title = element_blank(),
          legend.key = element_rect(fill="#d5e4eb"),
          legend.key.size = unit(0.8, "cm")) +  
          ylab("No. of COVID-19 patients") +
        xlab("Recovery Time (in days from date of diagnosis)") + 
        ggtitle("") 

p_recovery_hist <- p2


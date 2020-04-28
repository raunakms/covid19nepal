### RESHAPE DATA ---
dm_total <- reshape2::melt(dat_total, id.vars="date", value.name="value")
dm_total <- subset(dm_total, dm_total$variable %in% c("total_positive","active_case"))
dm_total$variable <- factor(dm_total$variable,  levels=c("total_positive","active_case"))

### PLOT ---
p <- ggplot(dm_total, aes(x=date, y=value)) +
        geom_point(aes(color=variable), alpha=1, size=2) +
        geom_line(aes(color=variable), alpha=1, size=1) +
        scale_color_manual(values=c(confirmed_color, active_color), labels=c("Total cases", "Active cases")) +
        #scale_fill_manual(values=c(confirmed_color, active_color), labels=c("Total cases", "Active cases")) +
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
          legend.key.size = unit(0.8, "cm")
          #legend.position = c(0.1,0.8),
          #legend.justification=c(0,0)
          ) +
          ylab("No. of COVID-19 Cases") +
          xlab("Date") + 
        ggtitle("") 

p_total_case_line <- p

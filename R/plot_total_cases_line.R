p <- ggplot(dat_total, aes(x=date, y=total_positive)) +
        geom_point(color=confirmed_color, alpha=1, size=2) +
        geom_line(color=confirmed_color, alpha=1, size=1)+
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
          ylab("Total Positive Cases") +
          xlab("Date") + 
        ggtitle("") 

p_total_case_line <- p

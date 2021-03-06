p <- ggplot(dat_total, aes(x=date, y=total_test)) +
        geom_point(color=test_color, alpha=1, size=2) +
        geom_line(color=test_color, alpha=1, size=1)+
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
                legend.key.size = unit(0.8, "cm"),
                legend.position = "none") +
        ylab("Total RT-PCR Test Conducted") +
        xlab("Date") + 
        ggtitle("") 

p_total_tests_line <- p

### PLOT TESTS: NPHL
d_nphl <- subset(dat_labs, dat_labs$lab_id == "NPHL")

p1 <- ggplot(d_nphl, aes(x=date, y=total_test)) +
        geom_point(aes(color=lab_id), alpha=1, size=2) +
        geom_line(aes(color=lab_id), alpha=1, size=1)+
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
          legend.position = "bottom") +
        ylab("Total RT-PCR Test Conducted") +
        xlab("Date") + 
        ggtitle("") 

p_nphl_test_line <- p1

### PLOT TESTS: OTHER LABS EXCEPT NPHL
d_labs <- subset(dat_labs, dat_labs$lab_id != "NPHL")

p2 <- ggplot(d_labs, aes(x=date, y=total_test)) +
      geom_point(aes(color=lab_id), alpha=1, size=2) +
      geom_line(aes(color=lab_id), alpha=1, size=1)+
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
        legend.position = "bottom") +
      ylab("Total RT-PCR Test Conducted") +
      xlab("Date") + 
      ggtitle("") 

p_labs_test_line <- p2

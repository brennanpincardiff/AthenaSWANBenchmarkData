library(ggplot2)
library(RCurl)

# what is the gender breakdown for clinical academics
# lecturers, Readers/SLs, Professors

# download the data
x <- getURL("https://raw.githubusercontent.com/brennanpincardiff/AthenaSWANBenchmarkData/master/Med_Schools_Council_data_PDFs/GenderBreakdown.csv")
data <- read.csv(text = x)

# check the data
str(data)
data$men <- as.integer(data$men)


p <- ggplot(data=data[1:18,], 
       aes(x = year, 
           y = percentF,
           colour = title)) +
      geom_point(size = 3) +
      geom_line(size = 1) +
      ylab("Clinical staff by grade (Percentage Female)") + 
      xlab("") +
      ylim(0,50) +
      theme_bw()

# y-axis label and text looks too small. 
p <- p + theme(axis.text = element_text(size = 14, face = "bold")) +
         theme(axis.title = element_text(size = 16, face = "bold"))

# reposition the legend
p <- p + theme(legend.position = c(1,0),     # moves legend to bottom right
               legend.justification = c(1,-0.05),  # moves it in a bit 
               legend.text=element_text(size = 12),  # larger text
               legend.title=element_text(size = 12))

p + labs(title = "Clinical Staff in UK \n Source: Medical Schools Council") +
    theme(plot.title = element_text(size = 18, face = "bold"))

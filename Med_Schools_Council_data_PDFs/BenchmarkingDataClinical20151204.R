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
      geom_point() +
      geom_line() +
      ylab("Clinical staff by grade (Percentage Female)") +
      xlab("Year") +
      ylim(0,50) +
      ggtitle("Benchmarking data - Clinical Staff in UK \n Source: Medical Schools Council") +
      theme_bw()
p

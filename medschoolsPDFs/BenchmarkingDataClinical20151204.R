library(ggplot2)
library(RCurl)

# who has the most researchers in the world?
# download the data
https://raw.githubusercontent.com/brennanpincardiff/AthenaSWANBenchmarkData/master/medschoolsPDFs/GenderBreakdown.csv

x <- getURL("https://raw.githubusercontent.com/brennanpincardiff/RforBiochemists/master/data/numberOfResearchersFTEUNdata_Export_20151019_214919785.csv")
data <- read.csv(text = x)

setwd("/Users/paulbrennan/Documents/AthenaSWANforGithub/AthenaSWANBenchmarkData/medschoolsPDFs")

data <- read.csv("GenderBreakdown.csv")
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

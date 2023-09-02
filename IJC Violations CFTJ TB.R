# Tomine Bergseth
# Data visualization for the Center for Truth and Justice (CFTJ), ICJ Violations Report/Infographic
# April 14, 2022

###############################################################


#clear global environment 
rm(list=ls())

#set working directory
setwd("C:/Users/tberg_cl8rsaz/OneDrive/Dokumenter/R/Training Data 412_413 F21")

library(ggplot2) #install data packages for use 
library(tidyverse)
library(readr)
library(dplyr)

install.packages("extrafont")
library(extrafont)
############################################

 
DF1 <- read.csv("DF_IJC_1.csv") %>% # reading in data and arranging the months
  arrange(Month) %>%
  mutate(Month = factor(Month, levels=c("December", "January", "February", "March", "April", "May"))) 
  

DF2 <- DF1 %>%
  group_by(Month, Measure) %>%
  count(Measure) %>% # counting instances for each provisional measure
  rename("Count" = "n")

###################################################################

windowsFonts(A = windowsFont("Times New Roman")) # setting the font

hist <- ggplot(DF1, aes(Month))+ # making a histogram
  geom_bar(aes(fill=Measure), width = 0.5)+
  theme(axis.text.x = element_text(angle=65, vjust=0.6))+
  theme_minimal()+
  scale_fill_manual(values = c("darkslateblue", 
                                "moccasin",
                                "darkgoldenrod1"), name = "Provisional Measure")+
  labs(title = "ICJ Violations: December 7, 2021 - June 7, 2022",
       x = "Month",
       y = "Count of Violations")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(text=element_text(family="A", face="bold", size=12))
  


hist





  
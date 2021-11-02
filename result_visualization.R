library(tidyverse)
library(data.table)
library(plotly)
setwd("C:/Users/Weiyu/Desktop/biogen/result")
data.s1 <- readRDS("sample_scenario_1raw.rds")
data.s2 <- readRDS("sample_scenario_2raw.rds")
data.s3 <- readRDS("sample_scenario_3raw.rds")
data.s4 <- readRDS("sample_scenario_4raw.rds")
data.s5 <- readRDS("sample_scenario_5raw.rds")
bias <- data.s1[c(1:6)]
bias
bias.wide <- do.call(rbind.data.frame, bias)
bias.long <- bias.wide %>% mutate(method=c(rep("sample",10000),
                              rep("js",10000),
                              rep("bs",10000),
                              rep("bsd1",10000),
                              rep("bsd2",10000),
                              rep("uv",10000))) %>%
  gather(group,value,V1:V3)
   
ggplot(bias.long, aes(x=group, y=value, fill=method)) + 
  geom_boxplot(alpha = 0.7) +
  stat_boxplot(geom ='errorbar') +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 8),
    axis.ticks.length = unit(-0.05, "in"),
    axis.text.y = element_text(margin=unit(c(0.3,0.3,0.3,0.3), "cm")), 
    axis.text.x = element_text(margin=unit(c(0.3,0.3,0.3,0.3), "cm")),
    axis.ticks.x = element_blank(),
    aspect.ratio = 1
  )







# create a data frame
variety=rep(LETTERS[1:7], each=40)
treatment=rep(c("high","low"),each=20)
note=seq(1:280)+sample(1:150, 280, replace=T)
data=data.frame(variety, treatment ,  note)






# grouped boxplot
ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
  geom_boxplot()library(ggplot2)

# create a data frame
variety=rep(LETTERS[1:7], each=40)
treatment=rep(c("high","low"),each=20)
note=seq(1:280)+sample(1:150, 280, replace=T)
data=data.frame(variety, treatment ,  note)

# grouped boxplot
ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
  geom_boxplot()

p1 <- ggplot(data, aes(x=variety, y=note, fill=treatment)) + 
  geom_boxplot() +
  facet_wrap(~treatment)
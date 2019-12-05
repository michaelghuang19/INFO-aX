library(dplyr)
library(data.table)
library(plotly)
library(ggplot2)
setwd("~/uw19.20/2019.9/info201/workspace/INFO-aX")


df <- read.csv("data/master.csv")


# we can group_by, or anything else since this is very fluid notebook.

by_gen <- df %>%
  group_by(generation) %>%
  summarise(Avg_Suicides_Per_100k = mean(suicides.100k.pop)) %>%
  ggplot(aes(x = generation, y = Avg_Suicides_Per_100k)) + 
  geom_bar(stat = "identity")

by_year <- df %>%
  group_by(year) %>%
  summarise(Avg_Suicides_Per_100k = mean(suicides.100k.pop)) %>%
  ggplot(aes(x = year, y = Avg_Suicides_Per_100k)) + 
  geom_bar(stat = "identity")

# we need to rename country here for some reason

by_year_us <- df %>%
  select(labels(df[1])[2] == "United States") %>%
  group_by(year) %>%
  summarise(Avg_Suicides_Per_100k = mean(suicides.100k.pop)) %>%
  ggplot(aes(x = year, y = Avg_Suicides_Per_100k)) + 
  geom_bar(stat = "identity")
  
# here, we want a line graphs over time with all of the 
# different data points included, just categorized

by_age_us <- df %>%
  select(country == "United States") %>%
  group_by(age)

by_sex_us <- df %>%
  select(country == "United States") %>%
  group_by(sex)

# Maybe further gender, age differences
  
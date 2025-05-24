# Load and install required packages
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("DiagrammeR")) install.packages("DiagrammeR")
if (!require("igraph")) install.packages("igraph")
if (!require("psych")) install.packages("psych")
if (!require("remotes")) install.packages("remotes")

remotes::install_github("afihasan/seminrlocal")

library(tidyverse)
library(seminrlocal)
library(DiagrammeR)
library(igraph)
library(psych)

# Load data
df <- read_csv("data/clean_survey.csv")  # Replace this path as needed

# Data Preprocessing
# This setup is particular to my project not necessarily how you would need to do yours
df <- df %>%
  mutate(
    age    = factor(age, levels = c("Below 18", "18-25", "26-35"), ordered = TRUE),
    year   = factor(year, levels = c("1", "2", "3"), ordered = TRUE),
    group  = factor(group, levels = c("presurvey", "postsurvey"), ordered = TRUE),
  )

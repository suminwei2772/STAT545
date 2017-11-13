library(readr)
library(ggplot2)
library(readr)
library(tidyverse)

args <- commandArgs(TRUE)

knitr::opts_chunk$set(echo=TRUE)
en <- read_tsv(args[1], col_names="Length")
fig <- ggplot(en) + 
					aes(x=Length) + 
					geom_histogram(binwidth=1) +
					ggtitle("Distribution of Word Lengths")

ggsave("length_distribution.png", fig)
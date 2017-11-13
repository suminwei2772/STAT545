library(readr)
library(ggplot2)
library(readr)
library(tidyverse)

args <- commandArgs(TRUE)

knitr::opts_chunk$set(echo=TRUE)
en <- read_tsv(args[1], col_names="Length")
en_start <- read_tsv(args[2], col_names=c("Word","Starting.Letter"))

## plotting the distribution of word lengths
fig <- ggplot(en) + 
					aes(x=Length) + 
					geom_histogram(binwidth=1) +
					ggtitle("Distribution of Word Lengths")

ggsave("length_distribution.png", fig)

fig2 <- ggplot(en_start, aes(x=Starting.Letter)) +
					geom_bar() +
					ggtitle("Number of words starting with each letter in the alphabet")
	
ggsave("n_starts.png", fig2)	
	
	
	
	
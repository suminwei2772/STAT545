library(tidyverse)
args <- commandArgs(TRUE)
words <- read.delim(args[1], header=FALSE)
words$V1 <- as.character(words$V1)

word_length <- data.frame(apply(words, 1, nchar));

words$start <- data.frame(do.call('rbind', strsplit(words$V1,'',fixed=TRUE)))[,1]
# word_starts <- words %>% 
# 								group_by(start) %>% 
# 								count()

word_starts <- words

write.table(word_length, "words_length.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(word_starts, "words_starts.txt", quote=FALSE, row.names=FALSE, col.names=FALSE, sep="\t")



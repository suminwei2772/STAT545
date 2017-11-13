args <- commandArgs(TRUE)
words <- read.delim(args[1], header=FALSE)
words$V1 <- as.character(words$V1)

word_length <- data.frame(apply(words, 1, nchar));

write.table(word_length, "words_length.txt", quote=FALSE, row.names=FALSE, col.names=FALSE)
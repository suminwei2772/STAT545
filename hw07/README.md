# STAT547 Homework 7

## Folder containing responses for hw07. 

1. Final Report:

* [hw07_make.md](w07_make.md) is the final report that presents original data, the statistical summaries of word lengths, and the distributions of words.


2. Makefile: 

* [Makefile](Makefile) is the file which uses Make to execute each step sequentially to generate files [words_length.txt](words_length.txt), [words.en.crlf.txt](words.en.crlf.txt), [words_starts.txt](words_starts.txt), and the images [length_distribution.png](length_distribution.png) and [n_starts.png](n_starts.png).

3. Individual R scripts:

* [step1_download_data.R](step1_download_data.R) downloads the data from http://www-01.sil.org/linguistics/wordlists/english/wordlist/wordsEn.txt

* [step2_read_data_analysis.R](step2_read_data_analysis.R) reads in the data as a data frame and calculates the lengths of each word.

* [step3_draw_fig.R](step3_draw_fig.R) draws a plot of the distributions of the words.







hw07 word length report using make
================
Lisa Wei
2017-11-12

``` r
library(readr)
library(ggplot2)
library(readr)
library(tidyverse)
```

    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

``` r
args <- commandArgs(TRUE)
```

Step 1: Dwonloading and writing to data frame the orginal data showing all the english words

Source: <http://www-01.sil.org/linguistics/wordlists/english/wordlist/wordsEn.txt>

``` r
knitr::opts_chunk$set(echo=TRUE)

en_words <- read_tsv(args[1], col_names="Words")
```

    ## Parsed with column specification:
    ## cols(
    ##   Words = col_character()
    ## )

``` r
head(en_words, n=100)
```

    ## # A tibble: 100 x 1
    ##        Words
    ##        <chr>
    ##  1         a
    ##  2       aah
    ##  3     aahed
    ##  4    aahing
    ##  5      aahs
    ##  6  aardvark
    ##  7 aardvarks
    ##  8  aardwolf
    ##  9        ab
    ## 10     abaci
    ## # ... with 90 more rows

Step 2: Lengths of each words was calculated

``` r
word_length <- data.frame(apply(en_words, 1, nchar)); colnames(word_length) <- c("Length")
head(word_length, n=100)
```

    ##     Length
    ## 1        1
    ## 2        3
    ## 3        5
    ## 4        6
    ## 5        4
    ## 6        8
    ## 7        9
    ## 8        8
    ## 9        2
    ## 10       5
    ## 11       5
    ## 12       6
    ## 13       8
    ## 14       5
    ## 15       7
    ## 16       8
    ## 17       7
    ## 18       9
    ## 19      11
    ## 20       9
    ## 21       9
    ## 22      10
    ## 23      10
    ## 24      11
    ## 25      12
    ## 26       8
    ## 27       5
    ## 28       6
    ## 29       8
    ## 30       9
    ## 31       6
    ## 32       7
    ## 33       6
    ## 34       5
    ## 35       7
    ## 36       9
    ## 37       7
    ## 38       8
    ## 39       9
    ## 40      10
    ## 41       7
    ## 42       8
    ## 43       5
    ## 44       6
    ## 45       9
    ## 46      10
    ## 47       6
    ## 48       7
    ## 49       6
    ## 50       7
    ## 51       6
    ## 52       8
    ## 53       6
    ## 54       8
    ## 55       9
    ## 56       8
    ## 57       6
    ## 58       8
    ## 59       4
    ## 60       5
    ## 61       6
    ## 62       8
    ## 63       5
    ## 64       6
    ## 65       5
    ## 66       9
    ## 67       7
    ## 68       6
    ## 69       9
    ## 70      10
    ## 71       6
    ## 72       4
    ## 73       6
    ## 74      10
    ## 75      11
    ## 76      11
    ## 77      12
    ## 78      12
    ## 79      13
    ## 80      11
    ## 81      12
    ## 82       3
    ## 83       9
    ## 84       8
    ## 85       9
    ## 86       9
    ## 87      10
    ## 88      10
    ## 89      11
    ## 90       9
    ## 91       7
    ## 92       8
    ## 93       9
    ## 94      11
    ## 95       6
    ## 96       8
    ## 97       9
    ## 98       9
    ## 99      10
    ## 100      8

``` r
# word_length was also written to a text file as shown below
# en <- read_tsv("words_length.txt", col_names="Length")
```

Step 3: Drawing a graph - a histogram of the distribution of the lengths of the English words.

![plot](length_distribution.png)

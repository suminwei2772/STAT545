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
```

The table below shows the first 100 words

``` r
en_words <- read_tsv(args[1], col_names="Words")
```

    ## Parsed with column specification:
    ## cols(
    ##   Words = col_character()
    ## )

``` r
knitr::kable(head(en_words, n=100))
```

| Words         |
|:--------------|
| a             |
| aah           |
| aahed         |
| aahing        |
| aahs          |
| aardvark      |
| aardvarks     |
| aardwolf      |
| ab            |
| abaci         |
| aback         |
| abacus        |
| abacuses      |
| abaft         |
| abalone       |
| abalones      |
| abandon       |
| abandoned     |
| abandonedly   |
| abandonee     |
| abandoner     |
| abandoners    |
| abandoning    |
| abandonment   |
| abandonments  |
| abandons      |
| abase         |
| abased        |
| abasedly      |
| abasement     |
| abaser        |
| abasers       |
| abases        |
| abash         |
| abashed       |
| abashedly     |
| abashes       |
| abashing      |
| abashment     |
| abashments    |
| abasing       |
| abatable      |
| abate         |
| abated        |
| abatement     |
| abatements    |
| abater        |
| abaters       |
| abates        |
| abating       |
| abatis        |
| abatises      |
| abator        |
| abattoir      |
| abattoirs     |
| abbacies      |
| abbacy        |
| abbatial      |
| abbe          |
| abbes         |
| abbess        |
| abbesses      |
| abbey         |
| abbeys        |
| abbot         |
| abbotcies     |
| abbotcy       |
| abbots        |
| abbotship     |
| abbotships    |
| abbott        |
| abbr          |
| abbrev        |
| abbreviate    |
| abbreviated   |
| abbreviates   |
| abbreviating  |
| abbreviation  |
| abbreviations |
| abbreviator   |
| abbreviators  |
| abc           |
| abdicable     |
| abdicate      |
| abdicated     |
| abdicates     |
| abdicating    |
| abdication    |
| abdications   |
| abdicator     |
| abdomen       |
| abdomens      |
| abdominal     |
| abdominally   |
| abduct        |
| abducted      |
| abducting     |
| abduction     |
| abductions    |
| abductor      |

Step 2: Lengths of each words was calculated

``` r
word_length <- data.frame(apply(en_words, 1, nchar)); colnames(word_length) <- c("Length"); rownames(word_length) <- NULL
```

Below is the word lengths of the first 100 words

``` r
knitr::kable(head(word_length, n=100))
```

|  Length|
|-------:|
|       1|
|       3|
|       5|
|       6|
|       4|
|       8|
|       9|
|       8|
|       2|
|       5|
|       5|
|       6|
|       8|
|       5|
|       7|
|       8|
|       7|
|       9|
|      11|
|       9|
|       9|
|      10|
|      10|
|      11|
|      12|
|       8|
|       5|
|       6|
|       8|
|       9|
|       6|
|       7|
|       6|
|       5|
|       7|
|       9|
|       7|
|       8|
|       9|
|      10|
|       7|
|       8|
|       5|
|       6|
|       9|
|      10|
|       6|
|       7|
|       6|
|       7|
|       6|
|       8|
|       6|
|       8|
|       9|
|       8|
|       6|
|       8|
|       4|
|       5|
|       6|
|       8|
|       5|
|       6|
|       5|
|       9|
|       7|
|       6|
|       9|
|      10|
|       6|
|       4|
|       6|
|      10|
|      11|
|      11|
|      12|
|      12|
|      13|
|      11|
|      12|
|       3|
|       9|
|       8|
|       9|
|       9|
|      10|
|      10|
|      11|
|       9|
|       7|
|       8|
|       9|
|      11|
|       6|
|       8|
|       9|
|       9|
|      10|
|       8|

``` r
# word_length was also written to a text file as shown below
# en <- read_tsv("words_length.txt", col_names="Length")
```

Step 3: Drawing a graph - a histogram of the distribution of the lengths of the English words.

![plot](length_distribution.png)

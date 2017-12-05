API
================
Lisa Wei
2017-11-30

API
---

having a url, post other things on url OMDb API: <https://www.omdbapi.com/> --&gt; get info about movies

If enter movie title: get the API <http://www.omdbapi.com/?t=Thor&y=2017> --&gt; intended for computers to look at

need a key to access the information: ask for an API key
--------------------------------------------------------

``` r
library(httr)
#library(XML)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(glue)
```

    ## 
    ## Attaching package: 'glue'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     collapse

``` r
library(tibble)
```

``` r
thor_result <- httr::GET(url = "http://www.omdbapi.com/?t=Thor&y=2017&apikey=df5f9e85")
 
thor_content <- content(thor_result)
#thor_content %>% View()
```

``` r
get_movie_TY <- function(title, year){
    query_string <- glue("http://www.omdbapi.com/?t={title}&y={year}&apikey=df5f9e85")
    movie_result <- GET(query_string)
    movie_content <- content(movie_result)
    return(movie_content)
}
```

``` r
babe <- get_movie_TY(title="babe",year="")
#View(babe)

## Empty spaces are not good
neo <- get_movie_TY(title="Matrix",year="1999")

## Error in View : cannot coerce class "c("xml_document", "xml_node")" to a data.frame

##The tibble package has a function enframe() that solves this problem by coercing nested list objects to nested tibble ("tidy" data frame) objects.
time <- get_movie_TY(title="time",year="")

neo_df <- t(enframe(neo)); colnames(neo_df) <- names(neo); neo_df <- neo_df[-which(rownames(neo_df)=="name"),]
babe_df <- t(enframe(babe)); colnames(babe_df) <- names(babe); babe_df <- babe_df[-which(rownames(babe_df)=="name"),]
time_df <- t(enframe(time)); colnames(time_df) <- names(time); time_df <- time_df[-which(rownames(time_df)=="name"),]

df <- rbind(neo_df, babe_df, time_df); colnames(df) <- names(neo)
```

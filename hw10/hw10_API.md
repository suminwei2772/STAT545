API
================
Lisa Wei
2017-11-30

For this assignment, I've decided to use the OMDb API: `https://www.omdbapi.com/` to get info about movies.

### Need a key to access the information: ask for an API key

I requested an API key: `apikey=df5f9e85`

#### Load the relevant packages

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
library(knitr)
```

Example of getting movie info from the web
------------------------------------------

``` r
thor_result <- httr::GET(url = "http://www.omdbapi.com/?t=Thor&y=2017&apikey=df5f9e85")
 
thor_content <- content(thor_result)
#thor_content %>% View()
```

Let's write a function to retrieve movie info
---------------------------------------------

``` r
get_movie_TY <- function(title, year){
    query_string <- glue("http://www.omdbapi.com/?t={title}&y={year}&apikey=df5f9e85")
    movie_result <- GET(query_string)
    movie_content <- content(movie_result)
    return(movie_content)
}
```

Getting movie that contains `babe` or `time` in title and also `The Matrix`
---------------------------------------------------------------------------

``` r
babe <- get_movie_TY(title="babe",year="")

neo <- get_movie_TY(title="Matrix",year="1999")

time <- get_movie_TY(title="time",year="")
```

Formatting the outputs into table format
----------------------------------------

The tibble package has a function enframe() that solves this problem by coercing nested list objects to nested tibble ("tidy" data frame) objects.

``` r
neo_df <- t(enframe(neo)); colnames(neo_df) <- names(neo); neo_df <- neo_df[-which(rownames(neo_df)=="name"),]
babe_df <- t(enframe(babe)); colnames(babe_df) <- names(babe); babe_df <- babe_df[-which(rownames(babe_df)=="name"),]
time_df <- t(enframe(time)); colnames(time_df) <- names(time); time_df <- time_df[-which(rownames(time_df)=="name"),]

df <- rbind(neo_df, babe_df, time_df); colnames(df) <- names(neo)
```

Final output table with all the movies/info extracted from the web
------------------------------------------------------------------

``` r
kable(df)
```

|          | Title      | Year | Rated     | Released    | Runtime | Genre                   | Director                        | Writer                                                                         | Actors                                                           | Plot                                                                                                                                  | Language | Country            | Awards                                          | Poster                                                                                                                                                    | Ratings                                                                   | Metascore | imdbRating | imdbVotes | imdbID    | Type  | DVD         | BoxOffice | Production             | Website                          | Response |
|----------|:-----------|:-----|:----------|:------------|:--------|:------------------------|:--------------------------------|:-------------------------------------------------------------------------------|:-----------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------|:---------|:-------------------|:------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------|:----------|:-----------|:----------|:----------|:------|:------------|:----------|:-----------------------|:---------------------------------|:---------|
| neo\_df  | The Matrix | 1999 | R         | 31 Mar 1999 | 136 min | Action, Sci-Fi          | Lana Wachowski, Lilly Wachowski | Lilly Wachowski, Lana Wachowski                                                | Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving | A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers. | English  | USA                | Won 4 Oscars. Another 34 wins & 45 nominations. | <https://images-na.ssl-images-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg> | Internet Movie Database, 8.7/10, Rotten Tomatoes, 87%, Metacritic, 73/100 | 73        | 8.7        | 1,354,586 | tt0133093 | movie | 21 Sep 1999 | N/A       | Warner Bros. Pictures  | <http://www.whatisthematrix.com> | True     |
| babe\_df | Babe       | 1995 | G         | 04 Aug 1995 | 91 min  | Comedy, Drama, Family   | Chris Noonan                    | Dick King-Smith (novel), George Miller (screenplay), Chris Noonan (screenplay) | Christine Cavanaugh, Miriam Margolyes, Danny Mann, Hugo Weaving  | Babe, a pig raised by sheepdogs, learns to herd sheep with a little help from Farmer Hoggett.                                         | English  | Australia, USA     | Won 1 Oscar. Another 18 wins & 23 nominations.  | <https://images-na.ssl-images-amazon.com/images/M/MV5BYjg4ZjUzMzMtYzlmYi00YTcwLTlkOWUtYWFmY2RhNjliODQzXkEyXkFqcGdeQXVyNTUyMzE4Mzg@._V1_SX300.jpg>         | Internet Movie Database, 6.8/10, Rotten Tomatoes, 97%, Metacritic, 83/100 | 83        | 6.8        | 101,166   | tt0112431 | movie | 23 Sep 2003 | N/A       | Universal Pictures     | N/A                              | True     |
| time\_df | Time       | 2006 | NOT RATED | 10 Aug 2006 | 97 min  | Drama, Mystery, Romance | Ki-duk Kim                      | Ki-duk Kim                                                                     | Jung-woo Ha, Ji-Yeon Park, Jun-yeong Jang, Gyu-Woon Jung         | To save her relationship, a woman puts herself through extensive plastic surgery.                                                     | Korean   | Japan, South Korea | 3 wins & 1 nomination.                          | <https://images-na.ssl-images-amazon.com/images/M/MV5BMjA1NjU5OTcxNl5BMl5BanBnXkFtZTcwNTMyNjYzMQ@@._V1_SX300.jpg>                                         | Internet Movie Database, 7.3/10, Rotten Tomatoes, 79%, Metacritic, 73/100 | 73        | 7.3        | 10,430    | tt0497986 | movie | 06 Nov 2007 | N/A       | Lifesize Entertainment | N/A                              | True     |

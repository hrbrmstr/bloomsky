
`bloomsky` : Tools to Work with 'BloomSky' Weather Station Data

The 'BloomSky' weather station has a cloud service <https://www.bloomsky.com/> that centralizes data collection and provides a user interface for interactive data viewing as well as an 'API'. Tools are provided to work with the underlying weather data feeds from the site.

The following functions are implemented:

-   `bsky_public_station_data`: Retrieve current reading from a single BloomSky station
-   `bsky_get_reading`: Retrieve last, current station reading

### Installation

``` r
devtools::install_github("hrbrmstr/bloomsky")
```

### Usage

``` r
library(bloomsky)
library(tidyverse)

# current verison
packageVersion("bloomsky")
```

    ## [1] '0.1.0'

``` r
wx_dat <- bsky_public_station_data("gqBxp6apnJSnmpym")

glimpse(wx_dat)
```

    ## Observations: 1
    ## Variables: 16
    ## $ alt       <int> 39
    ## $ city      <chr> "Berwick"
    ## $ country   <chr> "US"
    ## $ followers <int> 0
    ## $ humidity  <int> 76
    ## $ id        <chr> "gqBxp6apnJSnmpym"
    ## $ img       <chr> "http://s3-us-west-1.amazonaws.com/bskyimgs/gqBxp6apnJSnmpymqJ1kr5esm5GkoJk=.jpg"
    ## $ lat       <dbl> 43.259
    ## $ lng       <dbl> -70.798
    ## $ name      <chr> "Berwick wx"
    ## $ pressure  <int> 1029
    ## $ temp      <dbl> 2.24
    ## $ timestamp <dttm> 2017-04-18 21:12:40
    ## $ uv        <int> 1252
    ## $ video     <chr> "http://s3.amazonaws.com/bskytimelapses/gqBxp6apnJSnmpym_-4_2017-04-18.mp4"
    ## $ forecast  <list> <c("10 PM", "11 PM", "12 AM", "1 AM", "2 AM"), c("4", "3", "3", "2", "2"), c("39", "37", "37", "...

``` r
bsky_get_reading()
```

    ## No encoding supplied: defaulting to UTF-8.

    ##   utc cityname searchable devicename        registertime dst boundedpoint       lon
    ## 1  -4  Berwick       TRUE Berwick wx 2017-04-18 12:42:57   1              -70.80047
    ##                                                                   videolist
    ## 1 http://s3.amazonaws.com/bskytimelapses/gqBxp6apnJSnmpym_-4_2017-04-18.mp4
    ##                                                                   videolist_c numoffollowers      lat alt
    ## 1 http://s3.amazonaws.com/bskytimelapses/gqBxp6apnJSnmpym_-4_2017-04-18_C.mp4              0 43.25911  39
    ##                                                                  previewimagelist luminance temperature
    ## 1 http://s3-us-west-1.amazonaws.com/bskyimgs/gqBxp6apnJSnmpymqJ1kr5esmpWmnJs=.jpg         1      36.032
    ##                                                                          imageurl                  ts  rain humidity
    ## 1 http://s3-us-west-1.amazonaws.com/bskyimgs/gqBxp6apnJSnmpymqJ1kr5esm5GkoJk=.jpg 2017-04-18 21:12:40 FALSE       76
    ##   pressure devicetype voltage night uvindex             imagets
    ## 1    30.39       SKY1    2658  TRUE       1 2017-04-18 20:01:24

### Test Results

``` r
library(bloomsky)
library(testthat)

date()
```

    ## [1] "Tue Apr 18 21:13:12 2017"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 0 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================

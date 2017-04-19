
`bloomsky` : Tools to Work with 'BloomSky' Weather Station Data

The 'BloomSky' weather station has a cloud service <https://www.bloomsky.com/> that centralizes data collection and provides a user interface for interactive data viewing. Tools are provided to work with the underlying weather data feeds from the site.

The following functions are implemented:

-   `bsky_station_data`: Retrieve current reading from a single BloomSky station

### Installation

``` r
devtools::install_github("hrbrmstr/bloomsky")
```

### Usage

``` r
library(bloomsky)

# current verison
packageVersion("bloomsky")
```

    ## [1] '0.1.0'

``` r
wx_dat <- bsky_station_data("gqBxp6apnJSnmpym")

dplyr::glimpse(wx_dat)
```

    ## Observations: 1
    ## Variables: 16
    ## $ alt       <int> 39
    ## $ city      <chr> "Berwick"
    ## $ country   <chr> "US"
    ## $ followers <int> 0
    ## $ humidity  <int> 42
    ## $ id        <chr> "gqBxp6apnJSnmpym"
    ## $ img       <chr> "http://s3-us-west-1.amazonaws.com/bskyimgs/gqBxp6apnJSnmpymqJ1kr5esmZWonJs=.jpg"
    ## $ lat       <dbl> 43.257
    ## $ lng       <dbl> -70.8
    ## $ name      <chr> "Berwick wx"
    ## $ pressure  <int> 1025
    ## $ temp      <dbl> 12.28
    ## $ timestamp <dttm> 2017-04-18 15:40:46
    ## $ uv        <int> 1632
    ## $ video     <chr> "http://s3.amazonaws.com/bskytimelapses/eaB1rJytnpS4q5W_-8_2016-12-10.mp4"
    ## $ forecast  <list> <c("4 PM", "5 PM", "6 PM", "7 PM", "8 PM"), c("9", "9", "8", "7", "6"), c("48", "48", "46", "45"...

### Test Results

``` r
library(bloomsky)
library(testthat)

date()
```

    ## [1] "Tue Apr 18 15:51:14 2017"

``` r
test_dir("tests/")
```

    ## testthat results ========================================================================================================
    ## OK: 0 SKIPPED: 0 FAILED: 0
    ## 
    ## DONE ===================================================================================================================

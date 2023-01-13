
<!-- README.md is generated from README.Rmd. Please edit that file -->

# {nasis}

<!-- badges: start -->
<!-- badges: end -->

The goal of {nasis} is to provide a National Soil Information System
(‘NASIS’) Data Model abstraction layer via ‘dm’ and ‘DBI’

## Installation

You can install the development version of {nasis} like so:

``` r
remotes::install_github("brownag/nasis")
```

## Example

This is a basic example of how to use an SQLite data source (an
‘RSQLite’ `DBIConnection`) to create a NASIS data model object.

``` r
library(nasis)
# remotes::install_github("brownag/soilDBdata") # install (if needed)

dsn <- system.file("extdata", "fetchNASIS_pedons.sqlite", package = "soilDBdata")

d <- nasis(dsn)
#> Loading required namespace: soilDB
#> Loading required namespace: RSQLite
#> Loading required namespace: dbplyr
#> Keys could not be queried: no such table: information_schema.tables. Use
#> `learn_keys = FALSE` to mute this message.

class(d)
#> [1] "dm"

d$site
#> # Source:   table<`site`> [?? x 112]
#> # Database: sqlite 3.38.5 [/home/andrew/R/x86_64-pc-linux-gnu-library/4.2/soilDBdata/extdata/fetchNASIS_pedons.sqlite]
#>    usiteid     latstddecimalde… longstddecimald… geocoordsource gpspositionaler…
#>    <chr>                  <dbl>            <dbl>          <int>            <dbl>
#>  1 2015MT6630…             48.8            -114.             NA               NA
#>  2 2015MT6630…             48.6            -114.             NA               NA
#>  3 2015MT6630…             48.6            -114.             NA               NA
#>  4 2015MT6630…             48.4            -113.             NA               NA
#>  5 2015MT6630…             48.9            -114.             NA               NA
#>  6 2015MT6630…             48.9            -114.             NA               NA
#>  7 2015MT6630…             48.9            -114.             NA               NA
#>  8 2015MT6630…             48.9            -114.             NA               NA
#>  9 2015MT6630…             48.9            -114.             NA               NA
#> 10 2015MT6630…             48.9            -114.             NA               NA
#> # … with more rows, and 107 more variables: gpspdop <int>, plsssection <int>,
#> #   plsstownship <chr>, plssrange <chr>, plssmeridian <int>,
#> #   stateareaiidref <int>, stateareatypeiidref <int>, countyareaiidref <int>,
#> #   countyareatypeiidref <int>, mlraareaiidref <int>, mlraareatypeiidref <int>,
#> #   vegplotsize <int>, elev <dbl>, elevcorrected <dbl>, geomposhill <int>,
#> #   geomposmntn <int>, geompostrce <int>, geomposflats <int>,
#> #   hillslopeprof <int>, geomslopeseg <int>, slope <dbl>, aspect <int>, …
```

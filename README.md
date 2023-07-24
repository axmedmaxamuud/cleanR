
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cleanR

<!-- badges: start -->
<!-- badges: end -->

The goal of cleanR is to provide some functionalists that can facilitate
data cleaning.

## Installation

You can install the development version of cleanR from GitHub with:

``` r
# install.packages("devtools")
remotes::install_github("axmedmaxamuud/cleanR")
```

## Examples

### Create blank logbook

This is a basic example of creating a blank logbook that you can use it
later to save the observation with issues.

``` r
library(cleanR)

my_logbook <- logbook()
```

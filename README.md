
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cleanR

<!-- badges: start -->
<!-- badges: end -->

The goal of cleanR is to provide some functionalists that can facilitate
data cleaning.

## Installation

You can install the development version of cleanR from GitHub:

``` r
# install.packages("devtools")
remotes::install_github("axmedmaxamuud/cleanR")
```

## Examples

### Step 1: Create blank logbook

This is a basic example of creating a blank logbook that you can use it
later to save the observation with issues.

``` r
library(cleanR)

# create the logbook
my_logbook <- logbook()

# inspect the head of the logbook
head(my_logbook)
#> [1] uuid          question.name issue         feedback      action       
#> [6] old.value     new.value    
#> <0 rows> (or 0-length row.names)
```

### Step 2: Log issues in the logbook

Now you can inspect the data and use the log_issue() to write the
observations of the data that you find with the issues in the logbook.

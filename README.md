
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

``` r
check_age <- data %>% 
  filter(ki_age < 15) %>% 
  log_sheet(question.name = "ki_age",
            issue = "respondent is under 15 years old",
            action = "delete")
# inspect the check_age data
head(check_age)
#>                                       uuid question.name
#> 1 4182fa56-e689-484345-888c8e-e12a90657bf8        ki_age
#> 2 cf35eab9-3fa1-464442-b4bdb2-27139e8450da        ki_age
#> 3 b67f2895-ca54-40454e-969a91-fcb573d409e8        ki_age
#> 4 d091c452-b147-444d48-9a9e9d-be20f47863d1        ki_age
#>                              issue feedback action old.value new.value
#> 1 respondent is under 15 years old          delete        10          
#> 2 respondent is under 15 years old          delete        10          
#> 3 respondent is under 15 years old          delete        13          
#> 4 respondent is under 15 years old          delete        14
```

now you can merge the check_age data with the logbook so you can
maintain one logbook that can be exported at the end.

``` r
my_logbook <- rbind(my_logbook, check_age)

head(my_logbook)
#>                                       uuid question.name
#> 1 4182fa56-e689-484345-888c8e-e12a90657bf8        ki_age
#> 2 cf35eab9-3fa1-464442-b4bdb2-27139e8450da        ki_age
#> 3 b67f2895-ca54-40454e-969a91-fcb573d409e8        ki_age
#> 4 d091c452-b147-444d48-9a9e9d-be20f47863d1        ki_age
#>                              issue feedback action old.value new.value
#> 1 respondent is under 15 years old          delete        10          
#> 2 respondent is under 15 years old          delete        10          
#> 3 respondent is under 15 years old          delete        13          
#> 4 respondent is under 15 years old          delete        14
```

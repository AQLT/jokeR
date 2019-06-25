
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jokeR

Database from <https://github.com/taivop/joke-dataset>

## Installation

``` r
# Install development version from GitHub
# install.packages("devtools")
devtools::install_github("AQLT/jokeR")
```

## Usage

Add to your `.Rprofile` (`file.edit("~/.Rprofile")`):

``` r
.First <- function() {
    cat("Joke of the day:\n")
    jokeR::random_joke()
}
```


<!-- README.md is generated from README.Rmd. Please edit that file -->

# jokeR

## Installation

``` r
# Install development version from GitHub
# install.packages("devtools")
devtools::install_github("AQLT/jokeR")
```

## Usage

To print a random joke you can use the function `random_joke()`:

``` r
library(jokeR)
random_joke()
```

You can also specify from which database you want a random joke and on
which categories (use `joke_categories()` to check the available ones).
For example to only have jokes religious and animal jokes:

``` r
random_joke(categories = c("Animal", "Animals", "Religious"))
```

To print a message each time you open your session the most simple is to
edit your `Rprofile.site` file. If R is installed in `C:\Program
Files\R\R-n.n.n` this file will be located in the `C:\Program
Files\R\R-n.n.n\etc` directory. You can also use the function:

``` r
edit_rprofile.site()
```

Then, if you use RStudio, you can add the following command to print a
message each time you open RStudio (thanks
[davidgohel](https://github.com/davidgohel) for the tip\!):

``` r
setHook("rstudio.sessionInit", function(newSession) {
  if (newSession){
    print(jokeR::random_joke())
  }
}, action = "append")
```

Otherwise you can also change the `.First()` function:

``` r
.First <- function() {
  print(jokeR::random_joke())
}
```

## Databases

For the moment the database are from
<https://github.com/taivop/joke-dataset> (jokes from stupidstuff and
wocka).

## Futur developments

Have more and smaller databases on various topics: jokes, citations,
poems, etc.  
Add category argument to jokes.

#' Random joke
#'
#' Function to print a random joke from a database
#' @param data database to use
#' @examples
#' random_joke()
#' @export
random_joke <- function(data = c("stupidstuff.json","wocka.json"),
                        categories){
    data <- match.arg(data,several.ok = TRUE)
    data <- sample(data, 1)
    data_path <- system.file("extdata", data, package = "jokeR")

    json_data <- jsonlite::fromJSON(txt = data_path)
    json_data$data <- sub("\\.json", "", data)
    if (!missing(categories)) {
        json_data <- json_data[json_data$category %in% categories, ]
    }
    if (nrow(json_data) > 0) {
        random_joke_i <- sample(seq_len(nrow(json_data)), 1)
        random_joke <- json_data[random_joke_i, ]
    }else{
        random_joke <- json_data
    }
    class(random_joke) <- c("random_joke", class(random_joke))
    random_joke
}
#' Joke categories
#'
#' Function to get the different categories to filter random jokes
#'
#' @examples
#' joke_categories()
#' @export
joke_categories <- function(){
    list(stupidstuff = c("Animals", "Aviation", "Bar Jokes", "Blind Jokes", "Blonde Jokes",
                         "Business", "Children", "Computers", "Crazy Jokes", "Deep Thoughts",
                         "English", "Ethnic Jokes", "Family, Parents", "Farmers", "Food Jokes",
                         "Heaven and Hell", "Holidays", "Idiots", "Insults", "Lawyers",
                         "Light Bulbs", "Love & Romance", "Marriage", "Medical", "Men",
                         "Military", "Miscellaneous", "Money", "Music", "Office Jokes",
                         "Old Age", "One Liners", "Police Jokes", "Political", "Redneck",
                         "Religious", "School", "Science", "Sex", "Sports", "State Jokes",
                         "Women", "Yo Mama"),
         wocka = c("Animal", "At Work", "Bar", "Blond", "Blonde", "Children",
                   "College", "Gross", "Insults", "Knock-Knock", "Lawyer", "Lightbulb",
                   "Medical", "Men / Women", "News / Politics", "One Liners", "Other / Misc",
                   "Puns", "Redneck", "Religious", "Sports", "Tech", "Yo Mama",
                   "Yo Momma"))
}
# data_path <- "inst/extdata/stupidstuff.json"
# json_data <- jsonlite::fromJSON(txt = data_path)
# dput(sort(unique(json_data$category)))
#
# data_path <- "inst/extdata/wocka.json"
# json_data <- jsonlite::fromJSON(txt = data_path)
# dput(sort(unique(json_data$category)))

#' @export
print.random_joke <- function(x, ...){
    if (nrow(x) > 0) {
        cat("Random joke from ", x$data, ":\n", sep = "")
        cat(x$body)
        cat("\n")
    }
    invisible(x)
}

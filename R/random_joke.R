#' Random joke
#'
#' Function to print a random joke from a database
#' @param data database to use
#' @examples
#' random_joke()
#' @export
random_joke <- function(data = c("stupidstuff.json","wocka.json")){
    data <- match.arg(data)
    data_path <- system.file("extdata", data, package = "jokeR")

    json_data <- rjson::fromJSON(file = data_path)
    random_joke <- sample(seq_along(json_data), 1)
    cat(json_data[[random_joke]]$body)
}

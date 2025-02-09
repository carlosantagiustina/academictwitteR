#' Get tweets to users
#'
#' This function collects tweets between specified date ranges that are 
#' in reply to the specified user(s). Tweet-level data is stored in a data/ path as a series of JSONs beginning 
#' "data_"; User-level data is stored as a series of JSONs beginning "users_". If a filename is supplied, 
#' this function will save the result as a RDS file, otherwise it will return the results as a dataframe.
#' 
#' @param users character vector, user handles from which to collect data
#' @param start_tweets string, starting date
#' @param end_tweets  string, ending date
#' @param bearer_token string, bearer token
#' @param n integer, amount of tweets to be fetched
#' @param file string, name of the resulting RDS file
#' @param data_path string, if supplied, fetched data can be saved to the designated path as jsons
#' @param bind_tweets If `TRUE`, tweets captured are bound into a data.frame for assignment
#' @param verbose If `FALSE`, query progress messages are suppressed
#' @param ... arguments will be passed to `build_query()` function. See `?build_query()` for further information.
#'
#' @return a data frame
#' @export
#'
#' @examples
#' \dontrun{
#' bearer_token <- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
#' users <- c("uoessps", "spsgradschool")
#' get_to_tweets(users, "2020-01-01T00:00:00Z", "2020-01-05T00:00:00Z", 
#'              bearer_token, data_path = "data/")
#' }
get_to_tweets <-
  function(users,
           start_tweets,
           end_tweets,
           bearer_token,
           n = 100,
           file = NULL,
           data_path = NULL,
           bind_tweets = TRUE,
           verbose = TRUE,
           ...) {
    query <- add_query_prefix(users, "to:")
    get_all_tweets(query, start_tweets, end_tweets, bearer_token, n, ...)
  }

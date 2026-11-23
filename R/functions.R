# Reference versions of the functions students build in each chapter.
# Chapters from "Spread and Standard Error" onwards load this file so
# they can reuse earlier functions without redefining them. Students keep
# their own versions in exercises/my_functions.R, under the same headings.


# PART I: BASICS AND SUMMARY STATISTICS ====================================


# From Equations to Code ---------------------------------------------------

my_mean <- function(x) {
  total <- sum(x)
  n <- length(x)
  output <- total / n
  return(output)
}

my_var <- function(x) {
  n <- length(x)
  mean_x <- my_mean(x)
  squared_distances <- (x - mean_x)^2
  total_squared_distance <- sum(squared_distances)

  output <- total_squared_distance / (n - 1)
  return(output)
}


# Spread and Standard Error ------------------------------------------------

my_sd <- function(x) {
  output <- sqrt(my_var(x))
  return(output)
}

my_se <- function(x) {
  n <- length(x)
  sd_x <- my_sd(x)
  output <- sd_x / sqrt(n)
  return(output)
}

my_summary <- function(x) {
  output <- tibble(
    n = length(x),
    mean = my_mean(x),
    variance = my_var(x),
    sd = my_sd(x),
    se = my_se(x)
  )
  return(output)
}

my_z_score <- function(x) {
  mean_x <- my_mean(x)
  sd_x <- my_sd(x)
  output <- (x - mean_x) / sd_x
  return(output)
}


# PART II: INFERENTIAL TESTS ==============================================


# The One-Sample t-Test ----------------------------------------------------

my_t_value <- function(x, comparison_value) {
  mean_x <- my_mean(x)
  se_x <- my_se(x)
  output <- (mean_x - comparison_value) / se_x
  return(output)
}

my_t_test <- function(x, comparison_value) {
  t <- my_t_value(x, comparison_value)
  df <- length(x) - 1
  output <- tibble(t = t, df = df)
  return(output)
}


# Covariance and Correlation -----------------------------------------------

my_covariance <- function(x, y) {
  dx <- x - my_mean(x)
  dy <- y - my_mean(y)
  products <- dx * dy
  output <- sum(products) / (length(x) - 1)
  return(output)
}

my_correlation <- function(x, y) {
  covariance <- my_covariance(x, y)
  sd_x <- my_sd(x)
  sd_y <- my_sd(y)
  output <- covariance / (sd_x * sd_y)
  return(output)
}

my_correlation_t <- function(x, y) {
  r <- my_correlation(x, y)
  n <- length(x)
  output <- r * sqrt((n - 2) / (1 - r^2))
  return(output)
}

#' Square a vector
#'
#' That's it -- this function just squares a vector.
#'
#' @param x The vector to be squared.
#'
#' @return A vector that is the square of \code{x}.
#'
#' @details
#' This function isn't complicated.
#'
#' And it almost certainly doesn't need two paragraphs in the "Details"
#' section!
#'
#' Here are some reasons why putting a list in this section is excessive:
#' \itemize{
#'      \item This \code{square} function is quite simple.
#'      \item There's nothing else to say about \code{square}.
#' }
#'
#' @examples
#' square(1:10)
#' square(-5)
#' @export


square <- function(x) pow(x,a=2)





#' general function to compute any power for a vector
#'
#' @param x The vector to be operated on.
#'
#' @return A vector that is raised to the power of \code{x}.
#'
#' @param a The power
#'
#' @return The power to apply to the vector
#'
#' @details
#' This function isn't complicated.
#'
#' Here are some reasons why putting a list in this section is excessive:
#' \itemize{
#'      \item This \code{pow} function is quite simple.
#'      \item There's nothing else to say about \code{pow}.
#' }
#'
#' @examples
#' pow(1:10)
#' pow(-5)
#' @export
#'
pow <- function(x, a=2) x^a

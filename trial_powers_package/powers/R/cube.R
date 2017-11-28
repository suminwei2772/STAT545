#' Cube of a vector
#'
#' This function takes the cube if a number or each element of a vector.
#'
#' @param x The number or vector to be cubed
#'
#' @return A vector that is the cube of \code{x}.
#'
#' @details
#' This function is built upon the \code{pow} function, with the \code{a} set as 3.
#'
#'
#' @examples
#' cube(1:10)
#' cube(-5)
#' @export


cube <- function(x) pow(x, a=3)

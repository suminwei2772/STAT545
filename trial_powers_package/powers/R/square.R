#' Square a vector
#'
#' This function squares each element of a vector.
#'
#' @param x The vector to be squared.
#'
#' @return A vector that is the square of \code{x}.
#'
#' @details
#' This function is built upon the \code{pow} function, with the \code{a} set as 2.
#'
#' @examples
#' square(1:10)
#' square(-5)
#' @export


square <- function(x) pow(x,a=2)





#' Raise a vector to a power.
#'
#' General function to compute any power for a vector
#'
#' @param x The vector to be operated on.
#'
#' @return A vector that is raised to the power of \code{x}.
#'
#' @param a The power
#'
#' @return The power to apply to the vector
#'
#' @param plot_it a logical indicating whether to generate a plot showing x on the x-axis and x raised to the power `a` on the y-axis.
#'
#' @return if TRUE then outputs a plot; if FALSE, then no plot is generated.
#'
#' @details
#' The output of this function also includes a plot showing the vector along the x-axis, and the output number after the vectors have been operated on by \code{pow}.
#'
#' Important class type of inputs:
#' \itemize{
#'      \item \code{x} and \code{y} must be numeric, otherwise would cause an error in the output.
#' }
#'
#' @examples
#' pow(1:10)
#' pow(-5)
#' @export
#'
pow <- function(x, a=2, plot_it=TRUE) {
	if (is.numeric(x) ==FALSE) stop("'x' must be of type numeric")
	if (is.numeric(a) == FALSE) stop("'a' must be of type numeric")
	res <- x^a
	if (plot_it) print(ggplot2::qplot(x, res))
	return(res)
}

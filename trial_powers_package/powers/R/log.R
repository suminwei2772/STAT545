#' Take the logarithm of a vector
#'
#' This function takes a log of a vector. The base of the logarithm is specified by the user.
#'
#' @param x The vector to be logged
#'
#' @return A vector that is the log of \code{x}.
#'
#' @param base The base of the log
#'
#' @return The base of the log to be applied to \code{x}
#'
#' @param plot_it a logical indicating whether to generate a plot showing x on the x-axis and x log-transformed on the y-axis.
#'
#' @return if TRUE then a plot is generated; if FALSE, no plot is generated.
#'
#' @details
#' This function requires that \code{base} be greater than or equal to 0.
#' The \code{lologarithm} function is essentially a wrapper around the \code{log} function in base R.
#'
#'
#' @examples
#' logarithm(1:10, base=2, plot_it=FALSE)
#' logarithm(-5, base=exp(1), plot_it=TRUE)
#' @export


logarithm <- function(x, base=10, plot_it=TRUE) {
	if (x<0){
		stop("'x' must be >=0")
	}
	res <- log(x,base=base)
	if(plot_it == TRUE){
		print(ggplot2::qplot(x, res))
	}
	return(res)
}
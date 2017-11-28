#' Transform Cartesian coordinates into polar coordinates
#'
#' @param x  A number or vector
#' @param y  A number or vector
#' @return a list with (1) the first element containing the radii and (2) the second element containing the angles.
#'
#' @details
#' This function transforms Cartesian coordinates into polar coordinates, as specified by \code{r} and \code{theta}.
#'
#' \code{r} is the radius.
#' \code{theta} is the angle from the x=axis.
#'
#' Definition of transformation from Cartesian to polar coodinates:
#' \itemize{
#'      \item \code{r = sqrt(x^2 + y^2)}.
#'      \item \code{theta = arctan(y/x)}.
#' }
#'
#'
#' @examples
#' pola_transform(x=c(1,4,10), y=c(2,8,32))
#' pola_transform(x=c(-1,-4,-10), y=c(2,8,32))
#' @export


polar_transform <- function(x, y){
  if (x==0 && y==0) stop("'x' and 'y' can't both be zero because angle will be undefined 'NaN'")
  if (is.numeric(x) ==FALSE | is.numeric(y) == FALSE) stop("'x' and 'y' must be of type numeric")
  r <- sqrt(x^2 + y^2)
  theta <- atan(y/x)
  polar_coord <- list(c(r),c(theta))
  names(polar_coord) <- c("radius","theta")
  return(polar_coord)
}






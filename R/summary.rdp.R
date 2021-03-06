#' Summarize the Power Analysis of Regression Discontinuity
#' 
#' \code{summary.rdp} is a \code{summary} method for class \code{"rdp"}
#' 
#' @method summary rdp
#' 
#' @param object An object of class \code{"rdp"}, usually a result of a call to \code{\link{rd_power}}.
#' @param digits Number of digits to display.
#' @param ... Additional arguments.
#' 
#' @return \code{summary.rdp} returns a list which has the following components:
#' \item{coefficients}{A matrix containing the mean, variance, and empirical alpha of each estimator.}
#'
#' @include rd_power.R
#' 
#' @export

summary.rdp <- function(object, digits = max(3, getOption("digits") - 3), ...) {

  colnames(object) = c("Repetitions", "Mean", "Std. Error", 
                       paste("alpha = ", as.numeric(colnames(object)[4:ncol(object)])*100, "%", sep = ''))
  object[, "Std. Error"] = sqrt(object[, "Std. Error"])
  
  outmat <- apply(object, 2, function(x) format(x, digits = digits))
  
  cat("Estimates:\n")
  print.default(outmat, quote = FALSE, print.gap = 2, right = FALSE)

  out <- list(coefficients = unclass(object))
  
  return(invisible(out))
} 
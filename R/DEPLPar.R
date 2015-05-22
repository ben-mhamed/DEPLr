#' DEPLPar constructor.
#' @description Creates an object of the DEPLPar class storing simulation parameters.
#' @slot value \code{numeric} or \code{vector} giving the values of parameters
#' @slot name \code{character} or \code{vector} of characters describing the parameter names
#' @slot unit \code{character} or \code{vector} of characters describing the units of parameters
#' @examples 
#' DEPLPar(value=3.0E4,name="Biomass",unit="t")
#' @export
DEPLPar <- function(value,name,unit){
  new(Class = "DEPLPar",value=value,name=name,unit=unit)
}


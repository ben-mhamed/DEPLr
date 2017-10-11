#' DEPLPar class and methods
#' @description A class for storing the parameters of a DEPLSim model
#' @return \code{DEPLPar} object
#' @slot value \code{numeric} or \code{vector} giving the values of parameters
#' @slot name \code{character} or \code{vector} of characters describing the parameter names
#' @slot unit \code{character} or \code{vector} of characters describing the units of parameters
#' @section Constructor: 
#'  The DEPLPar(object) constructor method allows simple creation of new DEPLPar object.
#' @seealso DEPLZone, DEPLFleet, DEPLSim
#' @examples 
#' DEPLPar(value=3.0E4,name="Biomass",unit="t")

setClass(Class = "DEPLPar",representation(value="numeric",
                                          name="character", 
                                          unit="character"
                                          ))

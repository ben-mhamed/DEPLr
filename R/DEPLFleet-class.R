#' DEPLFleet class and methods
#' @description A class for creating an object that describes a fleet
#' @slot n \code{integer}. The number of fleets.
#' @slot name \code{character} or \code{vector} of characters describing the fleets names
#' @slot catchability \code{numeric} or vector giving the catchability of each fleet
#' @section Constructor: 
#'  The DEPLFleet(object) constructor method allows simple creation of new DEPLFleet object.
#' @seealso DEPLSim, DEPLPar, DEPLZone. 
#' @examples 
#' DEPLFleet(n=1,name="artisanal",catchability=3.2E-5)
#' @export

setClass(Class = "DEPLFleet",representation(n="numeric",
                                           name="character",
                                           catchability="numeric"))
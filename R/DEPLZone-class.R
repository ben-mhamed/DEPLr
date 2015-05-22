#' DEPLZone class and methods
#' @description A class for creating an object that describes a fishing zone
#' @return \code{DEPLZone} object
#' @slot name \code{character}. The name of the zone.
#' @slot fleet \code{DEPLFleet}. An object of class DEPLFleet
#' @slot initAbund \code{numeric}. Abundance in the begining of the fishing season
#' @slot initLength \code{numeric}. Length in the begining of the fishing season
#' @slot propRec \code{numeric}. Proportion of total recruitment recieved by zone.
#' @slot data \code{array}. Fishing effort, Weekly natural mortality and recruitment distribution.
#' @section Constructor: 
#'  The DEPLZone(object) constructor method allows simple creation of new DEPLZone object.
#' @seealso DEPLPar, DEPLFleet, DEPLSim
#' @export

setClass(Class = "DEPLZone",representation(n="numeric",
                                           name="character",
                                          fleet="DEPLFleet", 
                                          initAbund="numeric",
                                          initLength="numeric",
                                          propRec="numeric",
                                          data="array"
                                          ))

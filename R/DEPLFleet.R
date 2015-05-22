#' DEPLFleet constructor
#' @description Creates an object of the DEPLFleet class representing a fleet exploiting the fishery.
#' @slot n \code{integer}. The number of fleets.
#' @slot name \code{character} or \code{vector} of characters describing the fleets names
#' @slot catchability \code{numeric} or vector giving the catchability of each fleet
#' @examples 
#' DEPLFleet(n=1,name="artisanal",catchability=3.2E-5)
#' @export
DEPLFleet <- function(n,name,catchability){
  new(Class = "DEPLFleet",n=n,name=name,catchability=catchability)
}


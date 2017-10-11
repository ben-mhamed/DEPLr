#' DEPLZone constructor
#' @description Creates an object of the DEPLZone class representing a zone exploited in the fishery.
#' @slot name \code{character}. The name of the zone.
#' @slot fleet \code{DEPLFleet}. An object of class DEPLFleet
#' @slot initAbund \code{numeric}. Abundance in the begining of the fishing season
#' @slot initLength \code{numeric}. Length in the begining of the fishing season
#' @slot propRec \code{numeric}. Proportion of total recruitment recieved by zone.
#' @slot data \code{array}
#' @export
DEPLZone <- function(n,name,fleet,initAbund,initLength,propRec,data){
  new(Class = "DEPLZone",n=n,name=name,fleet=fleet,initAbund=initAbund, 
      initLength=initLength,propRec=propRec,data=data)
}

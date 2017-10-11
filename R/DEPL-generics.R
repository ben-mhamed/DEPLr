#'fleet
#' @description Return the fleet exploiting the zones.
#' @return DEPLFleet object
#' @export
setGeneric(name = "fleet",def = function(object){
  standardGeneric(f = "fleet")
})

#' describe 
#' @description return a description of a DEPLZone in a data.frame
#' @export 
setGeneric(name = "describe",def = function(object){
  standardGeneric(f = "describe")
})

#' catch.n
#' @export
setGeneric(name = "catch.n",def = function(object){
  standardGeneric(f = "catch.n")
})

#' catch.wt
#' @export
setGeneric(name = "catch.wt",def = function(object){
  standardGeneric(f = "catch.wt")
})

#' stock.n
#' @export
setGeneric(name = "stock.n",def = function(object){
  standardGeneric(f = "stock.n")
})

#' stock.wt
#' @export
setGeneric(name = "stock.wt",def = function(object){
  standardGeneric(f = "stock.wt")
})

#' index
#' @export
setGeneric(name = "index",def = function(object){
  standardGeneric(f = "index")
})

#'catchability
#' @description Accessor of the catchability of a \code{DEPLFleet} object
#' @export
setGeneric(name = "catchability",def = function(x){
  standardGeneric(f = "catchability")
})

#'catchability<-
#'@description Accessor of the catchability of a \code{DEPLFleet} object
#'@export
setGeneric(name = "catchability<-",def = function(x,value){
  standardGeneric(f = "catchability<-")
})

#'zones
#'@description Return a DEPLZone object from a DEPLSim object
#'@export
setGeneric(name = "zones",def = function(object){
  standardGeneric(f = "zones")
})

#'controle
#'@description Return the controle parameter of the DEPLSim object
#'@export
#'
setGeneric(name = "controle",def = function(object){
  standardGeneric(f = "controle")
})
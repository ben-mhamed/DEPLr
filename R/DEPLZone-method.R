#' dim
#' @description Return the number of zones in a DEPLZone object.
#' @export
setMethod(f = "dim",signature = "DEPLZone",definition = function(x){
  return(x@n)
})

#'fleet
#' @description Return the fleet exploiting the zones.
#' @return DEPLFleet object
#' @export
setMethod(f = "fleet",signature = "DEPLZone",definition = function(object){
  return(object@fleet)
})

#'names
#' @description Returns the names of \code{DEPLZone} object
#' @export
setMethod(f = "names",signature = "DEPLZone",definition = function(x){
  return(x@name)
})

#'names<-
#'@export
setReplaceMethod(f = "names",signature="DEPLZone",definition=function(x,value){
  if(length(value)==x@n){
    x@name<-as.character(value)
    validObject(x)
    return(x)
  }else{
    stop("slot name in x object don't have the same length as value")
  }
})

#' describe 
#' @description return a description of a DEPLZone in a data.frame
#' @export 
setMethod(f = "describe",signature = "DEPLZone",definition = function(object){
  dt <- data.frame("Zone"=object@name,"Initial Abundance"=object@initAbund,"Initial Length"=object@initLength,"Recruitment percentage"=object@propRec*100)
  return(dt)
})

#'plot
#'@import ggplot2
#'@export
setMethod(f = "plot",signature = "DEPLZone",definition =function(x,y,...){
  percent_str <- paste(round(x@initAbund / sum(x@initAbund ) * 100,1), "%", sep="")
  zz <- data.frame(zone=x@name,Abundance=x@initAbund,percent=percent_str)
  ggplot(zz, aes(x="", y=Abundance, fill=zone)) + geom_bar(width=1,stat = "identity") +  
    geom_text(aes(y = Abundance/length(Abundance)+ c(0, cumsum(Abundance)[-length(Abundance)]), label = percent), size=5) + 
    coord_polar("y")
})

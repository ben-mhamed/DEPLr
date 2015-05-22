setValidity(Class = "DEPLFleet",method = function(object){
  if((length(object@name)!=object@n)|(length(object@catchability)!=object@n)){
    stop("Error in the slots of the DEPLFleet object")
  }else{
    if(!is.numeric(object@catchability)){
      stop("catchability must be numeric")
    }
  }
})

#'show
#'@description print a DEPLFleet object
#'@slot object of DEPLFleet class
#'@export
setMethod(f = "show",signature = "DEPLFleet",definition = function(object){
   v<- object@catchability
   names(v) <- object@name
   l <- list("n"=object@n,"catchability"=v)
   print(l)
})



#' dim
#' @description Return the number of fleets in a DEPLFleet object.
#' @export
setMethod(f = "dim",signature = "DEPLFleet",definition = function(x){
  return(x@n)
})

#'as.data.frame
#' @description Create a \code{data.frame} from the \code{DEPLFleet} object
#' @export
setMethod(f = "as.data.frame",signature = "DEPLFleet",definition = function(x, row.names = NULL, optional = FALSE, ...){
  dt <- data.frame("Fleet"=x@name,"Catchability"=x@catchability)
  return(dt)
})

#'names
#' @description Returns the names of \code{DEPLFleet} object
setMethod(f = "names",signature = "DEPLFleet",definition = function(x){
  return(x@name)
})

#'names<-
setReplaceMethod(f = "names",signature="DEPLFleet",definition=function(x,value){
    if(length(value)==x@n){
      x@name<-as.character(value)
      validObject(x)
      return(x)
    }else{
      stop("slot name in x object don't have the same length as value")
    }
})

#'catchability
#' @description Accessor of the catchability of a \code{DEPLFleet} object
#' @export
setMethod(f = "catchability",signature = "DEPLFleet",definition = function(x){
  return(x@catchability)
})

#'catchability<-
#'@description Accessor of the catchability of a \code{DEPLFleet} object
#'@export
setReplaceMethod(f = "catchability",signature="DEPLFleet",definition=function(x,value){
  if(length(value)==x@n){
    if(is.numeric(value)){
      x@catchability<-value
      validObject(x)
      return(x)
    }else{
      stop("argument must be numeric")
    }
  }else{
    stop("slot name in DEPLFleet object don't have the same length as value")
  }
})
#'show
#'@description Method for printing a DEPLPar object
#'@slot object object of DEPLPar class
#'@export
setMethod(f = "show",signature = "DEPLPar",definition = function(object){
  v <- object@value
  names(v) <- object@name
  l <- list("params"=v,"unit"=object@unit)
  print(l)
})


#'as.data.frame
#' @description Create a \code{data.frame} from the \code{DEPLPar} object
#' @export
setMethod(f = "as.data.frame",signature = "DEPLPar",definition = function(x, row.names = NULL, optional = FALSE, ...){
  dt <- data.frame("Parameter"=x@name,"value"=x@value,"unit"=x@unit)
  return(dt)
})

#'names
#' @description Returns the names of \code{DEPLPar} object
setMethod(f = "names",signature = "DEPLPar",definition = function(x){
  return(x@name)
})

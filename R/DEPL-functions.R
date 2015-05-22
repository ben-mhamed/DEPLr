#'LW
#'@description Length-Weight relationship
#'@return Weight corresponding to the giving length
LW <- function(length,object){
  a <- object@params@value[1]
  b <- object@params@value[2]
  wi <- round(a*length^b,0)
  return(wi)
}

#' growth
#' @description Theorical growth function of octopus after recruitment in weekly steps .
#' @return Weight per week of octopus 
growth <- function(object){
  a <- object@params@value[3]
  b <- object@params@value[4]
  Ptheo<-round(exp(a*(7*(0:51) +b)),0) 
  return(Ptheo)
}

#' age0
#' @description Return the initial age in the begining of fishing season in weeks.
age0 <- function(Ptheo,Pi){
  nbrzone <- length(Pi)
  t0 <- rep(NA,nbrzone)
  for(i in 1:nbrzone){
    t0[i]   <- which(abs(Ptheo-Pi[i])==min(abs(Ptheo-Pi[i])))
  }
  return(t0)
}

#'progressbar
#'@description progress bar from examples of utils package
progressBar <- function(x)
{
  pb <- txtProgressBar(min =0,max = 1,initial = 0,char = "=",title = "Simulation",style = 3)
  setTxtProgressBar(pb = pb,value = x,title = "Simulation")
}

# test
getExt <- function(file)
  tolower(substr(file,max(gregexpr("\\.", file)[[1]])+1,nchar(file)))

checkExt=function(x) (tolower(getExt(x))=="inp")

#' quant2.5
#' 
quant2.5 <- function(x){
  quantile(x = x,probs = 0.025)
}

#' quant97.5
#' 
quant97.5 <- function(x){
  quantile(x = x,probs = 0.975)
}
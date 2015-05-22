#'controle
#'@description Return the controle parameter of the DEPLSim object
#'@export
setMethod(f = "controle",signature = "DEPLSim",definition = function(object){
  description <- c("Constant natural mortality(1=TRUE,0=FALSE)",
                   "Value of natural mortality per week",
                   "Process error",
                   "Observation error",
                   "Number of simulations",
                   "Length of fishing season in weeks",
                   "Number of fleets",
                   "Number of Zones",
                   "Difference between survey and begining of fishing season",
                   "Total recruitment") 
  dt <- data.frame("Parameter"=object@controle@name,"Description"=description,"Value"=object@controle@value,"Unit"=object@controle@unit)
  return(dt)
})

#'zones
#'@description Return a DEPLZone object from a DEPLSim object
#'@export
setMethod(f = "zones",signature = "DEPLSim",definition = function(object){
  return(object@zones)
})

#'fleet
#'@description return a DEPLFleet object
#'@export
setMethod(f = "fleet",signature = "DEPLSim",definition = function(object){
  return(object@zones@fleet)
})

#'summary
#'@description Return a summary \code{data.frame} of the object in parameters
#'@import plyr
#'@export
#'
setMethod(f = "summary",signature = "DEPLSim",definition = function(object,stat="character"){
  x <- c("catch.n","catch.wt","cpue","stock.n","stock.wt")
  if(sum(x==stat)==0){
    return(paste("'",stat,"'"," don't match any of the available options.",sep=""))
  }else{
    if(stat=="cpue"){
      if(length(object@cpue)==1){
        return("object is empty")
      }else{
        xx <- adply(object@cpue,c(2,3,4),.fun = mean);names(xx)[4] <- "mean"
        yy <- adply(object@cpue,c(2,3,4),.fun = median);names(yy)[4] <- "median"
        zz <- adply(object@cpue,c(2,3,4),.fun = sd);names(zz)[4] <- "sd"
        tt <- adply(object@cpue,c(2,3,4),.fun = quant2.5)
        vv <- adply(object@cpue,c(2,3,4),.fun = quant97.5)
        arr <- cbind(tt,xx[,4],yy[,4],zz[,4],vv[,4])
        names(arr) <- c("week","fleet","zone","2.5%","mean","median","sd","97.5%")
        
        nw <- object@controle@value[6]
        fl <- object@zones@fleet@name
        zn <- object@zones@name
        arr$week <- factor(x = arr$week,label=paste("W",1:nw,sep=""))
        arr$fleet <- factor(x = arr$fleet,label=fl)
        arr$zone<- factor(x = arr$zone,label=zn)
        return(arr) 
      }
    }
    if(stat=="catch.wt"){
      if(length(object@catch.wt)==1){
        return("object is empty")
      }else{
        xx <- adply(object@catch.wt,c(2,3,4),.fun = mean);names(xx)[4] <- "mean"
        yy <- adply(object@catch.wt,c(2,3,4),.fun = median);names(yy)[4] <- "median"
        zz <- adply(object@catch.wt,c(2,3,4),.fun = sd);names(zz)[4] <- "sd"
        tt <- adply(object@catch.wt,c(2,3,4),.fun = quant2.5)
        vv <- adply(object@catch.wt,c(2,3,4),.fun = quant97.5)
        arr <- cbind(tt,xx[,4],yy[,4],zz[,4],vv[,4])
        names(arr) <- c("week","fleet","zone","2.5%","mean","median","sd","97.5%")
        nw <- object@controle@value[6]
        fl <- object@zones@fleet@name
        zn <- object@zones@name
        arr$week <- factor(x = arr$week,label=paste("W",1:nw,sep=""))
        arr$fleet <- factor(x = arr$fleet,label=fl)
        arr$zone<- factor(x = arr$zone,label=zn)
        return(arr)
      }
    }
    if(stat=="catch.n"){
      if(length(object@catch.n)==1){
        return("object is empty")
      }else{
        xx <- adply(object@catch.n,c(2,3,4),.fun = mean);names(xx)[4] <- "mean"
        yy <- adply(object@catch.n,c(2,3,4),.fun = median);names(yy)[4] <- "median"
        zz <- adply(object@catch.n,c(2,3,4),.fun = sd);names(zz)[4] <- "sd"
        tt <- adply(object@catch.n,c(2,3,4),.fun = quant2.5)
        vv <- adply(object@catch.n,c(2,3,4),.fun = quant97.5)
        arr <- cbind(tt,xx[,4],yy[,4],zz[,4],vv[,4])
        names(arr) <- c("week","fleet","zone","2.5%","mean","median","sd","97.5%")

        nw <- object@controle@value[6]
        fl <- object@zones@fleet@name
        zn <- object@zones@name
        arr$week <- factor(x = arr$week,label=paste("W",1:nw,sep=""))
        arr$fleet <- factor(x = arr$fleet,label=fl)
        arr$zone<- factor(x = arr$zone,label=zn)
        return(arr) 
      }
    }
    if(stat=="stock.n"){
      if(length(object@stock.n)==1){
        return("object is empty")
      }else{
        xx <- adply(object@stock.n,c(2,3),.fun = mean);names(xx)[3] <- "mean"
        yy <- adply(object@stock.n,c(2,3),.fun = median);names(yy)[3] <- "median"
        zz <- adply(object@stock.n,c(2,3),.fun = sd);names(zz)[3] <- "sd"
        tt <- adply(object@stock.n,c(2,3),.fun = quant2.5)
        vv <- adply(object@stock.n,c(2,3),.fun = quant97.5)
        arr <- cbind(tt,xx[,3],yy[,3],zz[,3],vv[,3])
        names(arr) <- c("week","zone","2.5%","mean","median","sd","97.5%")
        
        nw <- object@controle@value[6]
        fl <- object@zones@fleet@name
        zn <- object@zones@name
        arr$week <- factor(x = arr$week,label=paste("W",0:nw,sep=""))
        arr$zone<- factor(x = arr$zone,label=zn)
        return(arr) 
      }
    }
    if(stat=="stock.wt"){
      if(length(object@stock.wt)==1){
        return("object is empty")
      }else{
        xx <- adply(object@stock.wt,c(2,3),.fun = mean);names(xx)[3] <- "mean"
        yy <- adply(object@stock.wt,c(2,3),.fun = median);names(yy)[3] <- "median"
        zz <- adply(object@stock.wt,c(2,3),.fun = sd);names(zz)[3] <- "sd"
        tt <- adply(object@stock.wt,c(2,3),.fun = quant2.5)
        vv <- adply(object@stock.wt,c(2,3),.fun = quant97.5)
        arr <- cbind(tt,xx[,3],yy[,3],zz[,3],vv[,3])
        names(arr) <- c("week","zone","2.5%","mean","median","sd","97.5%")
        
        nw <- object@controle@value[6]
        fl <- object@zones@fleet@name
        zn <- object@zones@name
        arr$week <- factor(x = arr$week,label=paste("W",0:nw,sep=""))
        arr$zone<- factor(x = arr$zone,label=zn)
        return(arr) 
      }
    }
  }
})

#'catch.n
#'@description Accessor of the \code{catch.n} slot of a \code{DEPLSim} object
#'@return Array
#'@slot object of \code{DEPLSim} class
#'@export
setMethod(f = "catch.n",signature = "DEPLSim",definition = function(object){
  return(object@catch.n)  
})

#'catch.wt
#'@description Accessor of the \code{catch.wt} slot of a \code{DEPLSim} object
#'@return Array
#'@slot object of \code{DEPLSim} class
#'@export
setMethod(f = "catch.wt",signature = "DEPLSim",definition = function(object){
  return(object@catch.wt)  
})

#'stock.n
#'@description Accessor of the \code{stock.n} slot of a \code{DEPLSim} object
#'@return Array
#'@slot object of \code{DEPLSim} class
#'@export
setMethod(f = "stock.n",signature = "DEPLSim",definition = function(object){
  return(object@stock.n)  
})

#'stock.wt
#'@description Accessor of the \code{stock.wt} slot of a \code{DEPLSim} object
#'@return Array
#'@slot object of \code{DEPLSim} class
#'@export
setMethod(f = "stock.wt",signature = "DEPLSim",definition = function(object){
  return(object@stock.wt)  
})

#'index
#'@description Accessor of the \code{cpue} slot of a \code{DEPLSim} object
#'@return Array
#'@slot object of \code{DEPLSim} class
#'@export
setMethod(f = "index",signature = "DEPLSim",definition = function(object){
  return(object@cpue)  
})
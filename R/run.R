setGeneric(name = "run",def = function(object){
  standardGeneric(f = "run")
})
#'run
#'@description run a DEPLSim object.
#'@return DEPLSim object
#'@import data.table
#'@import stats
#'@export
#'
setMethod(f = "run",signature = "DEPLSim",definition = function(object){
  pr <- object@controle@value ### Controle parameters
  l0 <- object@zones@initLength  ### intial length in each zone
  N0 <- object@zones@initAbund   ### intial abundance in each zone
  ri <- object@zones@propRec     ### proportion of recruitment for each zone
  fl <- object@zones@fleet@name  ### fleet names
  qi <- object@zones@fleet@catchability  ### catchability of each fleet
  Ri <- cbind(object@zones@data[,pr[8]+1,1:pr[8]]) ### Distribution of recruitment over the season
  Zi <- sim@zones@name   ### Zones names
  nz <- pr[8]
  ns <- pr[5]
  nf <- pr[7]
  nw <- pr[6]
  if(pr[1]==1){
    Mi <- matrix(rep(pr[2],nz*nw),ncol=nz,nrow=nw)
  }else{
    Mi <- cbind(object@zones@data[,nf+2,1:nz])
  }
  Pt <- growth(object)   ### Theorical weigth over octopus life
  Pi <- LW(length =l0,object)   ### intial weights
  t0 <- age0(Ptheo = Pt,Pi=Pi)
  t0 <- t0+pr[9]
  P0 <- Pt[t0]
  B0 <- (N0*P0)/1e+06  ### intital biomasses
  Eff <- object@zones@data
  #sigma2p <- log(pr[3]^2+1)
  #sigma2o <- log(pr[4]^2+1)
  sigma2p <- pr[3]
  sigma2o <- pr[4]
  t <- 0
  d <- nz*ns
dimname1 <- list(paste("iter",1:ns,sep=""),paste("week",1:nw,sep=""),fl,Zi)
dimname2 <- list(paste("iter",1:ns,sep=""),paste("week",0:nw,sep=""),Zi)
catch.n <- array(data = NA,dim = c(ns,nw,nf,nz));dimnames(catch.n) <- dimname1
catch.wt <- array(data = NA,dim = c(ns,nw,nf,nz));dimnames(catch.wt) <- dimname1
stock.n <- array(data = NA,dim = c(ns,nw+1,nz));dimnames(stock.n) <- dimname2
stock.wt <- array(data = NA,dim = c(ns,nw+1,nz));dimnames(stock.wt) <- dimname2
cpue <- array(data = NA,dim = c(ns,nw,nf,nz));dimnames(cpue) <- dimname1
  for(i in 1:ns){ ### simulations
    for(j in 1:nz){  ### zones
      t <- t+1
      x <- t/d
      progressBar(x)
      stock.n[i,1,j] <- N0[j]
      stock.wt[i,1,j] <- B0[j]
      for(k in 1:nw){  ### season
        catchTot <- 0
        for(l in 1:nf){  ### fleets
          catchNm <- qi[l]*Eff[k,l,j]*stock.n[i,k,j]*exp(-Mi[k,j]/2) 
          LogcatchNm<-log(catchNm)
          LogcatchN <- rnorm(mean = LogcatchNm, sd = sigma2o^(0.5), n=1)
          catch.n[i,k,l,j] <- exp(LogcatchN)
          catch.wt[i,k,l,j] <-(catch.n[i,k,l,j]*Pt[t0[j]+k-1])/1e03
          if(Eff[k,l,j]>0){
            cpue[i,k,l,j] <- catch.wt[i,k,l,j]/Eff[k,l,j]
          }else{
            cpue[i,k,l,j] <- 0 
          }
          catchTot <- catchTot+catch.n[i,k,l,j] 
        }
        Nm <- max(stock.n[i,k,j]*exp(-Mi[k,j]) - catchTot*exp(-Mi[k,j]/2) + Ri[k,j]*pr[10]*ri[j]*exp(-Mi[k,j]/2),1)
        logNm <- log(Nm)
        logN <- rnorm(mean=logNm,sd=sigma2p^(0.5), n=1)
        stock.n[i,k+1,j] <- exp(logN)
        stock.wt[i,k+1,j] <- (stock.n[i,k+1,j]*Pt[t0[j]+k])/1e06
      }
    }
  }
object@catch.n <- catch.n
object@catch.wt <- catch.wt
object@stock.n <- stock.n
object@stock.wt <- stock.wt
object@cpue <- cpue
  return(object)
}) 


#' DEPLSim class and methods
#' @description A class for creating a simulation object under DEPLr
#' @slot controle \code{DPELPar}. Controle parameters of the simualtion.
#' @slot zones \code{DEPLZone}. Zones in the simulation.
#' @slot catch.n \code{array}. An \code{array} that stores the catch in numbers.
#' @slot catch.wt \code{array}. A \code{array} that stores the catch in weight.
#' @slot stock.n \code{array}. A \code{array} that stores the abundance of the stock.
#' @slot stock.wt \code{array}. A \code{array} that stores the biomass of the stock.
#' @slot cpue \code{array}. A \code{array} that stores the cpue data.
#' @section Constructor: 
#'  The DEPLSim(object) constructor method allows simple creation of new DEPLSim object.
#' @import stringr
#' @export
DEPLSim <- function(file="missing"){
  if(!missing(file)){
    tmp <- read.sim(file)
    controle=DEPLPar(value=c(tmp$cstNM,tmp$valNM,tmp$proErr,tmp$obsErr,tmp$nbrSim,tmp$season, 
                             tmp$nbrFleet,tmp$nbrZone,tmp$discard,tmp$recTot), 
                     name=c("cstNM","valNM","proErr","obsErr","nbrSim","season","nbrFleet",
                            "nbrZone","discard","recTot"),
                     unit="")
    fleet=DEPLFleet(n = tmp$nbrFleet,name =tmp$fleetName,catchability=tmp$catchability)
    params <- DEPLPar(value = c(tmp$LW,tmp$GF),name=c("L-W","G-F"),unit="")
    zones <- DEPLZone(n=tmp$nbrZone,name = tmp$zoneName,fleet = fleet,initAbund = tmp$initAbund,
                      initLength =tmp$initLenghts,propRec = tmp$propRec,data=tmp$dt.array)
    return(new(Class = "DEPLSim",controle=controle,params=params,zones=zones, 
               catch.n=array(),catch.wt=array(),stock.n=array(), 
               stock.wt=array(),cpue=array()))  
}
} 

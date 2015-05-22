#' DEPLSim class and methods
#' @description
#' A class that represents the Simulation Depeltion model for Octopus.
#' Creates an object of the DEPLSim class that implements the Simulation Depletion model.
#' @return \code{DEPLSim} object
#' @slot \code{controle}  \code{DEPLPar}
#' @slot \code{params}  \code{DEPLPar}
#' @slot \code{zones}  \code{DEPLZone}
#' @slot \code{catch.n}  \code{array}
#' @slot \code{catch.wt}  \code{array}
#' @slot \code{stock.n}  \code{array}
#' @slot \code{stock.wt}  \code{array}
#' @slot \code{cpue}  \code{array}
#' @author Abdelouahed BEN MHAMED
#' @seealso DEPLPar, DEPLZone, DEPLFleet

setClass(Class = "DEPLSim",representation(controle="DEPLPar",
                                          params="DEPLPar",
                                          zones="DEPLZone",
                                          catch.n="array",
                                          catch.wt="array",
                                          stock.n="array",
                                          stock.wt="array",
                                          cpue="array"))

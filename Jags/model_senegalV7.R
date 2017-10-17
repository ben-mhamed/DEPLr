rm(list = ls())
library(rjags)
library(mcmcplots)
setwd(dir = "INRH/Octopus/GT/Senegal/Senegala_Data/run13/")
df <- read.csv(file = "Data_Du_Modele.csv")
dff <- as.list(df)
data <- list()
data$nobs <- nrow(df)
data$nYears <- 18
data$Month <- df$Month
data$Pm <- df$Pm
data$CatchN_TOT <- df$CatchN_TOT
data$Year <- df$Year
data$Log_C_pa_wt <- log(df$CatchWT_PA[complete.cases(df$CatchWT_PA)])
data$nobsPA <- sum(complete.cases(df$CatchWT_PA))
data$Effort_PA <- df$Effort_PA[complete.cases(df$Effort_PA)]
data$Log_C_pi_wt <- log(df$CatchWT_PI[complete.cases(df$CatchWT_PI)])
data$Effort_PI <- df$Effort_PI[complete.cases(df$Effort_PI)]
data$nobsPI <- sum(complete.cases(df$Effort_PI))
data$Lambda <- df$Lambda

model <-  "model_senegal_V7.bugs"
jags <- jags.model(file =model,data =data,n.chains = 3,n.adapt = 100000)
mcmc.samples <- coda.samples(model =jags,variable.names = c('Q_PA','Log_Q_PA_Mean','Q_PI','Log_Q_PI_Mean',"N","M","Rec","Log_CPUE_sigma","Log_N_sigma","AC_pa_wt_Pred","AC_pi_wt_Pred"),200000,thin = 10)

quantiles <- summary(mcmc.samples)$quantiles

matplot(x = 1:120,y = cbind(df$CatchWT_PA[complete.cases(df$CatchWT_PA)],quantiles[1:120,3]),type = "l",main="PA")
matplot(x = 1:216,y = cbind(df$CatchWT_PI[complete.cases(df$CatchWT_PI)],quantiles[121:336,3]),type = "l",main="PI")

traplot(mcmc.samples, parms = c('M'))
denplot(mcmc.samples, parms = c('M'))
mcmcplot(mcmc.samples)
gelman.diag(x = mcmc.samples,multivariate = F)
gelman.plot(mcmc.samples)
codamenu()
# .libPaths("\\\\doe/dfsfr/HOME_FORS3/Lucas.Spangher/My Documents/R/R-3.3.0/library")
require(openxlsx)
require(maps)


setwd("/Users/lucas.spangher/Documents/ARPA-E Files/PowerPlantModel")
load("sim.rdata")

data = read.xlsx("generators_new.xlsx", sheet= "Operable", startRow = 2)

currentGen$Utility.Name = data$Plant.Name[as.numeric(row.names(currentGen))]

temp.data=currentGen[currentGen$type%in%c("PV", "Wind", "SolarThermal")&currentGen$age<2,]

write.csv(temp.data, "wind_solar_CSP.csv")

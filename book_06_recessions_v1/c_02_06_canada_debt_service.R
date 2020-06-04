# (c) 2019 Brian Romanchuk
source('startup.R')

recession <- pfetch('U@CANADIAN_RECESSIONS')
ser <- pfetch('STATCAN@38100238|v1038036699')
pp <- ShadeBars1(ser, recession,  
                 ylab="%",main="Canada: Household Debt To Disposable Income", 
                 startdate='1990-01-01')
pp <- SetXAxis(pp, "1990-01-01", 4)

ser <- pfetch('STATCAN@11100065|v1001696813')
p2 <- ShadeBars1(ser, recession,  
                 ylab="%",main="Canada: Household Debt Service Ratio (Interest and Principal)", 
                 startdate='1990-01-01')
p2 <- SetXAxis(p2, "1990-01-01", 4)

TwoPanelChart(pp, p2, "c_02_06_canada_debt.png","Shaded bars indicate recessions (C.D. Howe). Source: Statscan.")

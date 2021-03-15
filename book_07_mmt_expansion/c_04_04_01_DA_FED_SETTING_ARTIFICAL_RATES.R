source('startup.R')

tsy3m <- pfetch('F@DTB3')
tsy10 <- pfetch('F@DGS10')
recession <- pfetch('F@USREC')
ff <- pfetch('U@FedFunds')
ser <- ff
ser2 <- tsy3m
pp <- ShadeBars2(ser,  ser2, recession, legend =  c('Fed Funds Target*','3-month T-Bill'),
                 ylab="%",main="U.S. Short-Term Rates", legendhead='Rate',
                 startdate='1995-01-01')
pp <- SetXAxis(pp, "1995-01-01", 2)

ser2 <- tsy10
p2 <- ShadeBars2(ser,  ser2, recession, legend =  c('Fed Funds Target*','10-Year Treasury'),
                 ylab="%",main="Fed Funds And The 10-Year Yield", legendhead='Rate',
                 startdate='1995-01-01')
p2 <- SetXAxis(p2, "1995-01-01", 2)



TwoPanelChart(pp, p2, "c_04_04_01_DA_FED_SETTING_ARTIFICIAL_RATES.png","*Midpoint of range. Source: Fed H.15 (via FRED).")

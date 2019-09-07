# (c) 2019 Brian Romanchuk
source('startup.R')

RGDP <- pfetch('F@GDPC1')
recession <- pfetch('F@USREC')
ser <- pchange(RGDP, 4)
pp <- ShadeBars1(ser, recession, 
              'Ann % Chg', main='U.S. Real GDP Growth Rate And Recessions*',
              startdate = '1948-01-01')
pp <- SetXAxis(pp,"1948-01-01", "2019-01-01")
pp <- pp + geom_hline(yintercept=0,color=BondEconomicsBlue(),size=1)

OnePanelChart(pp,"c_01_03_NBER_GDP.png","*NBER definition. Source: BEA (via FRED).")

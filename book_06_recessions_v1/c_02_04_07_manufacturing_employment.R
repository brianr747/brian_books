# (c) 2019 Brian Romanchuk
source('startup.R')

payrolls <- pfetch('F@PAYEMS')
manemp <- pfetch('F@MANEMP')
ser <- 100*(manemp/payrolls)

ser <- ser['1960-01-01/2018-12-01']
recession <- pfetch('F@USREC')
pp <- ShadeBars1(ser, recession, 
              '%', main='U.S.: Manufacturing Share Of Total Nonfarm Employment',
              startdate = '1960-01-01')
pp <- SetXAxis(pp,"1960-01-01", "2018-12-01")

OnePanelChart(pp, "c_02_04_07_manufacturing_employment.png","Shade indicates NBER recessions. Source: BLS (via FRED).")


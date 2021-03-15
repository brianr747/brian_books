source('startup.R')


us_core_level <-pfetch('F@CPILFESL')
ser <- pchange(us_core_level, 12)
recession <- pfetch('F@USREC')
pp <- ShadeBars1(ser, recession, 
                 'Ann % Chg', main='U.S. Core CPI Inflation',
                 startdate = '1960-01-01')
pp <- SetXAxis(pp,"1960-01-01", 5)
pp <- pp + geom_hline(colour=BondEconomicsBlue(), yintercept=1)
pp <- pp + geom_hline(colour=BondEconomicsBlue(), yintercept=3)

pp <- pp + annotate("text",x=as.Date("2005-01-01"),y=4,size=2,label="Lines at 1% and 3%")


OnePanelChart(pp, "c_02_05_01_us_core_inf.png","Source: BLS. Shade represents NBER recessions.")

source('startup.R')

recession <- pfetch('F@USREC')
ff <- pfetch('U@FedFunds')
ser <- ff
pp <- ShadeBars1(ser,  recession,  
                 ylab="%",main="U.S. Policy Rate (Fed Funds)", 
                 startdate='1980-01-01')
pp <- SetXAxis(pp, "1980-01-01", 4)
#pp <- pp + geom_hline(yintercept=0,color=BondEconomicsBlue(),size=1)




OnePanelChart(pp, "c_02_05_02_fed_fundz.png","Source: Fed H.15 (via FRED). Midpoint of target range in recent history. ")

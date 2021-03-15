source('startup.R')

u3 <- pfetch('F@UNRATE')
NAIRU <- pfetch('F@NROU')
recession <- pfetch('F@USREC')




UNGAP <- NAIRU - u3
ser <- UNGAP["1990-01-01/2020-01-01"]
pp <- ShadeBars1(ser,  recession,   
                 ylab="%",main="U.S. Employment Gap (NAIRU less Unemployment)", 
                 startdate='1990-01-01')
pp <- SetXAxis(pp, "1990-01-01", "2019-12-01")
pp <- pp + geom_hline(yintercept=0,color=BondEconomicsBlue(),size=1)


wages <- pfetch('F@AHETPI')
ser <- pchange(wages, 12)
p2 <- ShadeBars1(ser["1990-01-01/2020-01-01"],  recession,   
                 ylab="Ann % Chg",main="U.S. Hourly Wage Inflation", 
                 startdate='1990-01-01')
p2 <- SetXAxis(p2, "1990-01-01", "2019-12-01")
#pp <- pp + geom_hline(yintercept=0,color=BondEconomicsBlue(),size=1)

TwoPanelChart(pp, p2, "c_02_03_02_emp_gap_wages.png","Source: BLS, CBO (via FRED).")





source('startup.R')


can_med_CPI <- pfetch('STATCAN@18100004|v41691154')
us_med_CPI <- pfetch('F@CPIMEDSL')

ser <- pchange(us_med_CPI, 12)
ser2 <- pchange(can_med_CPI, 12)
pp <- Plot2Ser(ser, ser2, c('U.S.', 'Canada'), 'Ann % Chg',
                    startdate='1990-01-01', ,main="North American Medical CPI", 
               legendhead="Medical Component Of CPI",
               legendpos=c(.8,.8))

pp <- SetXAxis(pp, '1990-01-01', 5)
pp <- pp + geom_hline(yintercept=0,color=BondEconomicsBlue(),size=1)

OnePanelChart(pp, "c_05_04_01_medical_costs.png","Sources: BLS (via FRED), Statscan.")





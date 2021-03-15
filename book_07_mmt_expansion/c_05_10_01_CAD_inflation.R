source('startup.R')



cad <- pfetch('STATCAN@33100036|v111666248')
core_nsa <- pfetch('STATCAN@18100004|v41691233')
# rrb <- rrb[rrb>0]
# Remove "0" which BoC uses instead of NULL. Grrr!
# Daily is too short; switch to monthly
cad <- cad[cad>0]
cad_m <- convertdm(cad)
recession <- pfetch('U@CANADIAN_RECESSIONS')

#cad <-   pfetch('STATCAN@33100036|v111666248')
ceri <-  pfetch('STATCAN@33100163|v111666277')
cad_m <- pfetch('STATCAN@33100163|v111666275')
ser <- pchange(ceri, 12)
ser2 <- pchange(core_nsa, 12)
pp <- ShadeBars2(ser["1990-01-01/2017-01-01"],  ser2["1990-01-01/2017-01-01"], recession, c('Canadian Dollar Index', 'Core Inflation'), 
                 ylab="Ann % Chg",main="Canada: Effective Exchange Rate Index And Inflation", 
                 startdate='1990-01-01', legendhead='Annual Change',
                 legendpos=c(.2, .8))
pp <- SetXAxis(pp, "1990-01-01", "2017-01-01")
pp <- pp + geom_hline(yintercept=0,color=BondEconomicsBlue(),size=1)




OnePanelChart(pp, "c_05_10_01_CAD_inflation.png","Source: Statscan, BoC.")

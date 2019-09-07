source('specialcharts2.R', encoding='UTF-8')

ser <- DBLoadFred("MDSP")

p2 <- MyNBERBars(ser["1980-01-01/2019-01-01"],"","U.S. Mortgage Debt Service Ratio*")
p2 <- SetXAxis(p2,"1994-01-01", "2019-01-01")
# p2 <- p2 + annotate("text",x=as.Date("2008-01-01"),y=90,size=4,label="")
# p2 <- p2 + geom_hline(yintercept=0, color=BondEconomicsBlue(), size=1)

PlotFromLowLevel(p2,"c_03_07_2_mortgage_service.png","*% Of disposible income. (Fed BoG via FRED).")

source("basefn2.R")
canada <- DBLoad("C V2057603")

grow <- pchange(canada,12)

pp <- PlotLowLevel1(grow["1980-01-01/"],"%","Canada: Annual Growth Rate In Aggregate Employment")

pp <- pp + geom_hline(yintercept=0, color=BondEconomicsBlue(), size=1)

construction <- DBLoad("C V2057608")

rat <- 100 * construction/canada 
p2 = PlotLowLevel1(rat["1980-01-01/"],"%",
                   "Canada: Percentage of Employees Working In Construction")
# p2 <- AddText(p2,"2014-09-01",7,"What could\ngo wrong?")


pp <- SetXAxis(pp,"1980-01-01",3)
p2 <- SetXAxis(p2,"1980-01-01",3)

Plot2FromLowLevel(pp,p2,"c20190329_canada_jobgrowth_construction.png",
                 "Source: Statistics Canada")

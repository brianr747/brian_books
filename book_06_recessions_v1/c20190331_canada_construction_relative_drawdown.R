source("basefn2.R")
canada <- DBLoad("C V2057603")

grow <- pchange(canada,12)
construction <- DBLoad("C V2057608")

construction_max = MovingMax(construction)
canada_max = MovingMax(canada)
loss_const = construction - construction_max
loss_canada = canada - canada_max
pp <- PlotLowLevel2(canada-canada_max, construction - construction_max, c('All Jobs', 'Construction'),
                    'Thousands','Canadian Job Drawdowns', legendhead = 'Drop From Peak',
                    legendpos = c(.55, .4)
              )


rat <- 100 * construction/canada 


pp <- SetXAxis(pp,"1976-01-01",3)

PlotFromLowLevel(pp,"c20190331_canada_construction_relative_drawdown.png",
                 "Source: Statistics Canada")

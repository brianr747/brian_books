source('specialcharts2.R', encoding='UTF-8')

ser <- DBLoad("C V62698065")

p2 <- PlotLowLevel1(ser,"%","Canada Household Debt-To-Disposable-Income Ratio")
p2 <- SetXAxis(p2,"1990-01-01", "2019-01-01")

PlotFromLowLevel(p2,"c_07_03_1_hockey_stick.png","Source: Statistics Canada")

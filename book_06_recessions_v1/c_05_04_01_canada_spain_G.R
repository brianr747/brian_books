source('book_utils.R')



can_G <- pfetch('D@IMF/WEO/CAN.GGX_NGDP')
recession = pfetch('U@CANADIAN_RECESSIONS')

pp <- ShadeBars1(can_G,  recession,  
                 ylab="% of GDP",main="Canadian General Government Expenditures",
                 startdate='1980-01-01')
pp <- SetXAxis(pp, "1980-01-01", "2019-01-01")



spain_G <- pfetch('D@IMF/WEO/ESP.GGX_NGDP')
recession_s <- pfetch('U@SPANISH_RECESSIONS')

p2 <- ShadeBars1(spain_G, recession_s, '% of GDP', main='Spanish General Government Expenditures',
                 startdate='1980-01-01')
p2 <- SetXAxis(p2, "1980-01-01", "2019-01-01")

TwoPanelChart(pp,p2, "c_05_04_01_canada_spain_G.png","Source: IMF. Shade represents recessions (C.D. Howe, Spanish Econ. Assoc.).")

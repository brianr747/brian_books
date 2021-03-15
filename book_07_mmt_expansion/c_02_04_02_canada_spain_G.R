source('startup.R')



can_G <- pfetch('D@IMF/WEO:2020-10/CAN.GGXWDG_NGDP.pcent_gdp')
recession = pfetch('U@CANADIAN_RECESSIONS')

pp <- ShadeBars1(can_G,  recession,  
                 ylab="% of GDP",main="Canadian General Government Expenditures",
                 startdate='1980-01-01')
pp <- SetXAxis(pp, "1980-01-01", "2021-01-01")



spain_G <- pfetch('D@IMF/WEO:2020-10/ESP.GGX_NGDP.pcent_gdp')
recession_s <- pfetch('U@SPANISH_RECESSIONS')

p2 <- ShadeBars1(spain_G, recession_s, '% of GDP', main='Spanish General Government Expenditures',
                 startdate='1980-01-01')
p2 <- SetXAxis(p2, "1980-01-01", "2021-01-01")

TwoPanelChart(pp,p2, "c_02_04_02_canada_spain_G.png","Source: IMF. Shade represents recessions (C.D. Howe, Spanish Econ. Assoc.).")

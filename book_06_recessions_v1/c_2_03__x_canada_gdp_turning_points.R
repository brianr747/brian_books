
source('book_utils.R')

gdp <- pfetch('D@OECD/QNA/CAN.B1_GE.VIXOBSA.Q')

ser <- pchange(gdp,4)
turning_indic <- pfetch('F@CANRECM')


# pp <- ShadeBars1(ser["1990-0101/"], turning_indic["1990-01-01/"], 
#               'Ann % Chg', main='Canadian Real GDP And OECD Leading Indicator Turning Points*')
# pp <- SetXAxis(pp,"1990-01-01", 3)
# pp <- pp + geom_hline(yintercept=0,color=BondEconomicsBlue(),size=1)
# # p2 = p2 + geom_rect(data=rec_dates, aes(xmin=Start, xmax=End, ymin=-Inf, ymax=+Inf), fill='pink', alpha=0.4)
# PlotFromLowLevel(pp,"c_2_03_1_canada_turning_points.png","*Shade represents turning points. Source: OECD (via DB.nomics & FRED).")

recession = pfetch('U@CANADIAN_RECESSIONS')
p2 <- ShadeBars1(ser["1990-0101/"], recession["1990-01-01/"], 
              'Ann % Chg', main='Canadian Real GDP And Recessions*')
p2 <- SetXAxis(p2,"1990-01-01", 3)
p2 <- p2 + geom_hline(yintercept=0,color=BondEconomicsBlue(),size=1)
# p2 = p2 + geom_rect(data=rec_dates, aes(xmin=Start, xmax=End, ymin=-Inf, ymax=+Inf), fill='pink', alpha=0.4)
OnePanelChart(p2,"c_02_03_01_canada_recessions.png","*C.D. Howe Business Cycle Council. Source: OECD (via DB.nomics).")

#----------------------------------------------------
UR <- pfetch('STATCAN@14100287|v2062815')
p3 <- ShadeBars1(UR["1990-0101/"], recession["1990-01-01/"], 
              'Ann % Chg', main='Canadian Unemploment Rate And Recessions*')
p3 <- SetXAxis(p3,"1990-01-01", 3)

# Minimum over 12 previous months *including current month*. (This way we
# always >= 0.
URmin = rollapplyr(UR, 12, min)
UR_rise = UR - URmin
p4 <- ShadeBars1(UR_rise["1990-01-01/"], recession["1990-01-01/"], 
              'Ann % Chg', main='Canadian Rise In Unemployment Rate And Recessions*')
p4 <- SetXAxis(p4,"1990-01-01", 3)
TwoPanelChart(p3, p4, "c_02_03_02_canada_UR_recessions.png","*C.D. Howe Business Cycle Council. Source: Statscan.")

#------------------------------------------------
# Show BoC Rate

target_rate = pfetch('STATCAN@10100139|v39079', database='SQL')
p5 <- ShadeBars1(target_rate["1993-01-01/"], recession["1993-01-01/"], 
              'Ann % Chg', main='Canadian Target Rate And Recessions*')
p5 <- SetXAxis(p5,"1993-01-01", 3)
OnePanelChart(p5,"c_02_03_03_canada_policy_rate_recessions.png","*C.D. Howe. Source: Bank of Canada via Statscan.")

#-----------------------------------------------
pp <- ShadeBars1(ser["1990-0101/"], turning_indic["1990-01-01/"], 
                 'Ann % Chg', main='Canadian Real GDP And OECD Leading Indicator Turning Points*')
pp <- SetXAxis(pp,"1990-01-01", 3)
pp <- pp + geom_hline(yintercept=0,color=BondEconomicsBlue(),size=1)
# p2 = p2 + geom_rect(data=rec_dates, aes(xmin=Start, xmax=End, ymin=-Inf, ymax=+Inf), fill='pink', alpha=0.4)

# UR Rise versus OECD
p6 <- ShadeBars1(UR_rise["1990-01-01/"], turning_indic["1990-01-01/"], 
              'Ann % Chg', main='Canadian Rise In Unemployment Rate* And OECD Turning Points**')
p6 <- SetXAxis(p6,"1990-01-01", 3)
TwoPanelChart(pp, p6,"c_02_03_04_canada_UR_rise_turning_point.png","*Rise versus min over past year. **OECD (via FRED). Source: Statscan.")



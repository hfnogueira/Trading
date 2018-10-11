# setup strategy in R

# While building a strategy one must initialize the portfolio, account, 
# strategy and then define the indicators to be used, signals to be generated and 
# rules to be followed.

library(quantstrat)
Sys.setenv(TZ = "Asia/Kolkata")
currency('INR')


init_date <- "2011-12-31"
start_date <- "2012-01-01"
end_date <- "2017-12-31"
init_equity <- 100000
adjustment <- TRUE

getSymbols(Symbols = "^NSEI", 
           src = "yahoo", 
           from = start_date, 
           to = end_date, 
           adjust = adjustment)


# After loading data using stock function define the meta-data of the symbol “NSEI”. 
# Here currency is “INR” and multiplier is 1. Multiplier is to be applied to the price.

stock("NSEI",currency="INR",multiplier = 1)



# Setup Strategy --------------------------------------------------------------------------------------------------

# Using quantstarat, before designing a strategy it is required to initialise certain settings 
# like portfolio, account, order and store the strategy.
# Portfolio is a collection of strategies. The advantage of portfolio is that 
# risk is spread over more than one strategy and overall risk decreases.
# Account is a collection of portfolios.
# Order is an instruction to buy or sell.


# Assign names to the portfolio, account and strategy as follows:
  
  
strategy.st<-"basic_strat"
portfolio.st<-"basic_portfolio"
account.st<-"basic_account"

# If there are any other portfolios or account book with these names remove them 
# using rm.strat function

#rm.strat(portfolio.st)
#rm.strat(account.st)



# initPortf 

# function is used to intialize the portfolio, this function takes 
# the name of portfolio, symbols and initialization date as arguments.

initPortf(name = portfolio.st,symbols = "NSEI",initDate = init_date)



# initAcct 
# function is used to intialize the account, this function takes 
# the name of portfolios, initial equity and initialization date as arguments.

initAcct(name = account.st,portfolios = portfolio.st,initDate = init_date,initEq = init_equity)




# initOrders 
# function is used to setup the orders, this function takes 
# the name of portfolios, symobols and initialization date as arguments.


initOrders(portfolio = portfolio.st,symbols = "NSEI",initDate = init_date)


#Store the strategy.st using strategy function.
strategy(strategy.st, store = TRUE)




# Indicators ------------------------------------------------------------------------------------------------------


#########################
# Simple Moving Average #
#########################

# SMA is the basic moving average used in trading. It is calculated by taking average of 
# closing prices over last “n” days.



# chartSeries 
# is used to create charts for a given time series object and this funcion has 
# argument TA which allows us to add technical indicators to the chart.

# Let us plot the closing prices of NSE and add SMA of 40 days period to it 
# using addSMA function as Technical indicator.


color="red"
chartSeries(NSEI$NSEI.Close,TA="addSMA(n=40,col=color)") 


########
# MACD #
########

# MACD stands for Moving Average Convergence and Divergence. 
# It is calculated by taking the difference between fast moving average and slow moving average.

#Compenents of MACD:
  
# i. MACD line
# It is the difference of faster EMA and slower EMA. Most commonly 26 days are used as duration for faster EMA and 12 days are used as duration for slower EMA.

# ii. MACD Signal line
# It is EMA of the MACD line and most commonly period length of 9 is chosen.

# iii. MACD Histogram
# It is histogram plot of difference between the MACD line and the signal line.



# Let us plot the closing prices of NSE and add MACD of 
# 12 days fast period, 26 days slow period, 9 day signal period to it using addMACD function as Technical indicator.


chartSeries(NSEI$NSEI.Close, TA="addMACD(fast = 12, slow = 26, signal = 9, histogram = TRUE)")


#######
# RSI #
#######

# RSI stands for Relative Strength Index. 
# It is used to compare the magnitude of recent gains and losses over a specified time period to measure speed and 
#change of price movements. RSI value varies between 0 and 100.

# RSI = 100-[100 / ( 1 + (Average of Upward Price Change / Average of Downward Price Change ) ) ]


chartSeries(NSEI$NSEI.Close, TA="addRSI(n=14)")


###################
# Bollinger Bands #
###################

# Bollinger Bands consists of upper and lower bands which are plotted 2 standard deviations away 
# from a simple moving average. 
# Standard deviation is measure of volaitilty, bands widens as volatility increases and narrows as volatility decreases.


sma="SMA"
bands="bands"
color="blue"
chartSeries(NSEI$NSEI.Close, TA="addBBands(n=20,maType=sma,draw=bands)")




# Adding indicator to strategy ------------------------------------------------------------------------------------
# Let us see how to add 40 day SMA to strategy:


# add.indicator 
# function is used to add indicators to the strategy. This function takes the strategy to which the 
# indicator is to be added, name of the function used as indicator in this case it is “SMA”, arguments 
# contains reuired parameters of the function used, here as we are using SMA parameters will be 
# closing price and the period “n” which is used to calculate SMA.

# mktdata 
# is dataset containing symbols coredata, indicators and signals. 
#This object will be created in environment when strategy is executed.

# Cl() 
# returns the closing price.

# quote function is used to return the arguments without evaluating them.

add.indicator(strategy.st, name = "SMA", 
              arguments = list(x=quote(Cl(mktdata)),n=40),
              label='SMA_40' )




# Let us see how to add RSI with 7 day period as indicator.

# RSI will take closing price and number of periods of moving averages as parameters.


add.indicator(strategy.st, name = "RSI", 
              arguments = list(x=quote(Cl(mktdata)),n=7),
              label='RSI_7' )



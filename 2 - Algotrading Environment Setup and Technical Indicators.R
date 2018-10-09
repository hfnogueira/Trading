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


# https://analyticsprofile.com/r-algo-trading-course/chapter-1-algotrading-basics-and-importing-financial-data-in-r/



# Introduction to R packages ---------------------------------------------------------------------------------------------------------------


#Quantstrat
#Quantstrat package in R provides various functions to build and back-test trading strategies.

#TTR
#TTR package in R provides various technical analysis functions to build trading rules. This package provides various functions to calculate technical indicators like MACD, SMA, EMA etc

#Quantmod
#Quantmod package in R is used provides a framework for quantitative financial modeling and trading. It also provides various functions to visualize the data.


library("devtools")

install_github("braverock/FinancialInstrument")
install_github("braverock/blotter")
install_github("braverock/quantstrat")
install_github("braverock/PerformanceAnalytics")


# Librarys --------------------------------------------------------------------------------------------------------

library("FinancialInstrument")
library("blotter")
library("quantstrat")
library("PerformanceAnalytics")


library(quantstrat)
Sys.setenv(TZ = "Asia/Kolkata") # vamos avaliar indice indiano
currency('INR') # moeda indiana



# import data -----------------------------------------------------------------------------------------------------

#Let us import NIFTY data from Jan 1st 2012 to Dec 31st 2017.
init_date <- "2011-12-31" #the date on which we want to intialize the portfolio and account
start_date <- "2012-01-01" #the date from which we want to collect the data
end_date <- "2017-12-31" #the date untill when we want to collect the data
init_equity <- 100000 #initial account equity value
adjustment <- TRUE #TRUE when we want to adjust prices otherwise FALSE



#getSymbols 
#funcion in Quantmod library helps to import the historical trading data. It has arguments as follows:
  
#symbols
#Name of the symbol to be loaded, to load more than one symbol pass vector of symbols

#src
#Quantmod allows us to import data from various sources like yahoo finance, Google finance etc into R, we can also specify the dates between which we want to collect the data.

#from
#start date from which we want to collect the data

#to – 
#end date untill when we want to collect the data

#adjust
#TRUE/FALSE depending on whether prices are to be adjusted or not







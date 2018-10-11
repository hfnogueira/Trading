# analyze the trading strategy results

################
# Chart trades #
################

chart.Posn(portfolio.st,"NSEI")


###############
# Trade Stats #
###############

# tradeStats 
# function is used to return the trade-level statistics within a portfolio. 
# This function returns important statistics like number of trades, number of transactions, 
# net profit, winloss ratio, sharpe ratio etc. 
# We will learn about these trade statistics in detail in this chapter. 
# But first lets just print all the tradestats using tradeStats function.

trade_stats <- tradeStats(portfolio.st)
trade_stats1 <- as.data.frame(t(tradeStats(portfolio.st)))
knitr::kable(trade_stats1)



# Now let us see what each of these trade stats means.



#####################
# Basic trade stats #
#####################

#in the output trade stats: 
  # Portfolio is the name of the portfolio, 
  # Symbol is the symbol of the stock, 
  # Num.Txns is the number of transactions made using the strategy and 
  # Num.Trades is the number of trades that are done using the strategy.

knitr::kable(trade_stats1[c("Portfolio","Symbol","Num.Txns","Num.Trades"),])



#############################
# Profit n Loss trade stats #
#############################


  # Net.Trading.PL 
  # is the total profit/loss made due to all trades, a positive value indicates profit and 
  # negative value indicates loss.


  # Avg.Trade.PL 
  # is the average profit/loss made due to all trades, 
  

  # Med.Trade.PL is the median of profit/loss made due to all trades. 
  # In case of extreme limits in profit/loss average value will be biased in such cases median gives a 
  # good understanding of central tendency of profit/loss.

  
  # Std.Dev.Trade.PL 
  # is the standard deviation between net profit/loss of trades and gives an idea about spread of net 
  # profit/loss. 

  # Std.Err.Trade.PL is standard error of the net profit/loss which is a measure of chopiness of the equity 
  # line and lower standard error is desirable.


# Similarly Avg.Daily.PL, Med.Daily.PL, Std.Dev.Daily.PL and Std.Err.Daily.PL gives average profit/loss, 
# median profit/loss, standard deviation between profit/loss of trades, standard error of the profit/loss 
# respectively considering the days on which transactions are made.

knitr::kable(trade_stats1[c("Net.Trading.PL","Avg.Trade.PL","Med.Trade.PL","Std.Dev.Trade.PL","Std.Err.Trade.PL","Avg.Daily.PL","Med.Daily.PL","Std.Dev.Daily.PL","Std.Err.Daily.PL"),])



###################
# Win Loss trades #
###################
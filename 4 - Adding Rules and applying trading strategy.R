## add rules to the strategy and apply strategy.
## https://analyticsprofile.com/r-algo-trading-course/chapter-4-adding-rules-and-applying-trading-strategy-in-r/



###########
## Rules ##
###########

# Rules will help us in determining the position in which we have to enter or exit the trade(long or short), 
# number of orders to be placed and type of orders to be placed.




# add.rule 
# function in quantstrat helps to add rules to the trading strategy. The arguments of this function are:

  # strategy– 
  # strategy to which rule is to be added, name– name of the rule usually a R function ruleSignal, arguments of the 
  # function, type– enter or exit, this tells whether we are entering market or exiting market and label– a text that 
  # will be used as name for the rule column that will be added to mktdata.

# ruleSignal 
# is the function which is used to generate orders. This function takes the following arguments:
  
  # sigcol– 
  # name of the signal column, sigval– value of the signal , orderqty– quantity of the order to be placed, 
  # ordertype– market or limit or stoplimit or stoptrailing or iceberg, orderside– long or short, 
  # TxnFees is the transaction fee per trade



# We will enter the market when Long Signal is true and we will exit the market either when macd_lt_0 or RSI_lt_50. 
# So totally we have to add 3 rules one for entering the trade lets label it ‘enter long’ 
# and 2 for exiting trade, label them as ‘long exit1’, ‘long exit2’.




##############
# Enter Long #
##############




# A rule labeled ‘enter long’ is added using add.rule function. 
# When values of Signal column Long are equal to “TRUE” a long side order of quantity 100 is placed to enter into 
# the market. replace = FALSE means this order cannot replace any open orders. type = "enter" since we are entering 
# the market from long side.


add.rule(strategy = strategy.st, name="ruleSignal", arguments = list(
  sigcol = "Long", sigval = TRUE, orderqty = 100, ordertype = "market",TxnFees = -75, 
  orderside = "long",prefer="Open", replace = FALSE), type = "enter",label='enter long')

# We have added rule to enter the trade based on Long signal, next we will add rule to exit the trade.



#############
# Exit Long #
#############

# Exit the trade from long side when either macd histogram cross the zero line from above or when RSI is less than 50. 
# So, two rules are to be added to exit the market from long side.


# Using add.rule function a rule labeled as ‘long exit1’ is added to exit the market from long side 
# When value of Signal macd_lt_0 is equal to “TRUE” with orderqty all.

  # orderqty=all 
  # means sell whatever is bought so far. 
  # type = "exit" 
  # since we are exiting the market from long side.

add.rule(strategy.st,name='ruleSignal', 
         arguments = list(sigcol="macd_lt_0",
                          sigval=TRUE, 
                          orderqty='all', 
                          ordertype='market', 
                          orderside='long', 
                          prefer="Open",
                          TxnFees = -75,
                          replace=TRUE),
         type='exit',
         label='long exit1'
         
)


# Using add.rule function a rule labeled as ‘long exit2’ is added to exit the market from long side with orderqty 
# all When value of Signal RSI_lt_50 is equal to “TRUE” 
# i.e., when RSI is less than 50. 
  # type = "exit" 
  # since we are exiting the market from long side.

add.rule(strategy.st,name='ruleSignal', 
         arguments = list(sigcol="RSI_lt_50",
                          sigval=TRUE, 
                          orderqty='all', 
                          ordertype='market', 
                          orderside='long', 
                          prefer="Open",
                          TxnFees = -75,orderset='ocolong',
                          replace=TRUE),
         type='exit',
         label='long exit2'
)



##################
# Apply Strategy #
##################

# Now we have added indicators, signals and rules to the strategy. Next step is to apply strategy.

  # applyStrategy 
  # function is used to execute strategy. This function takes the strategy and portfolios list as arguments.


applyStrategy(strategy = strategy.st,portfolios = portfolio.st)


# Notice from the above output that we are getting 100 and -100 alternatively, 100 means we have bought 100 shares and 
# -100 means we have sold all the 100 shares which we have bought so far.




# updatePortf 
# function calculates the PL for each period prices that are available.

updatePortf(portfolio.st)


# updateAcct 
# function is used to perform equity account calculations from the portfolio data and corresponding close prices.

updateAcct(account.st)


# updateEndEq 
# function is used to calculate End.Eq and Net.Performance

updateEndEq(account.st)




################
# Chart trades #
################

# chart.Posn 
# is used to produce 4 charts. 
  
  # The first one shows the prices and transactions made over time. 
  # The second chart shows the position fill when the transactions are made. 
  # The third chart shows the cumulative profit loss over time. 
  # The fourth chart shows the drawdown over time.


chart.Posn(portfolio.st,"NSEI")

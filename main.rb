require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoo_finance'

get '/quote/:ticker' do |ticker|
  @ticker = ticker

#   fields = [
#     :last_trade_price,
#     :earnings_per_share,
#     :dividend_per_share,
#     :change_from_52_week_high,
#     :change_From_52_week_low]

#   fields.map do |x|
#     YahooFinance.quotes([ticker], x)
#   end
# end

  @last_trade_price = YahooFinance.quotes([ticker], [:last_trade_price])[0][:last_trade_price]
  @earnings_per_share = YahooFinance.quotes([ticker], [:earnings_per_share])[0][:earnings_per_share]
  @dividend_per_share = YahooFinance.quotes([ticker], [:dividend_per_share])[0][:dividend_per_share]
  @change_from_52_high = YahooFinance.quotes([ticker], [:change_from_52_week_high])[0][:change_from_52_week_high]
  @change_from_52_low = YahooFinance.quotes([ticker], [:change_From_52_week_low])[0][:change_From_52_week_low]
  erb :quote
end


# get '/quote/*/*' do |tickers, fields|
#   tickers = params[:splat]
#   fields =params[:splat]

#   data = YahooFinance.quotes([tickers], [fields])[0][fields]


#   params[:splat][x].each do |x|
#   end




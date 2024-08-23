class Stock < ActiveRecord::Base
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    def self.find_by_ticker(ticker_symbol)
        where(ticker: ticker_symbol).first
    end
    
    def self.new_from_lookup(ticker_symbol)
        looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
        puts "name: #{looked_up_stock.name}"
        return nil unless looked_up_stock.name
        new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
        new_stock.last_price = new_stock.price
        puts "new stocks: #{new_stock.ticker}"
        new_stock
    end
    
    def price
        closing_price = StockQuote::Stock.quote(ticker).l
        return "#{closing_price} (Closing)" if closing_price
        opening_price = StockQuote::Stock.quote(ticker).op
        return "#{opening_price} (Closing)" if opening_price
        'Unvailable'
    end
end

class Article < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true, length: { minimum: 3}
    validates :description, presence: true, length: { minimum: 3} 
    validates :date, presence: true
    validates :user_id, presence: true
    
    def self.find_by(ticker_symbol)
        where(title: ticker_symbol).first ||
        where(tags: ticker_symbol).first 
    end
    
    
    def self.new_from_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    return nil unless looked_up_stock.name
    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
    new_stock.last_price = new_stock.price
    new_stock
    end
   
end 


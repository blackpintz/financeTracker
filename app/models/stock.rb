class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new( 
        publishable_token: Rails.application.credentials.sandbox_api_key,
        endpoint: 'https://sandbox.iexapis.com/v1')
        
        begin
            new(name: client.company(ticker_symbol).company_name,
                ticker: ticker_symbol, 
                last_price: client.price(ticker_symbol))
            rescue => exception
                return nil
        end
    end
    
    def self.check_db(ticker_symbol)
        where(ticker: ticker_symbol).first
    end
end

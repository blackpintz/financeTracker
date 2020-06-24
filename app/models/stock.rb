class Stock < ApplicationRecord
    
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
end

class StocksController < ApplicationController
    def search
        unless params[:stock].empty?
            @stock = Stock.new_lookup(params[:stock])
           unless @stock.nil?
               unless Stock.check_db(params[:stock]).nil?
                # @available = Stock.check_db(params[:stock]).users.include?(current_user)
               end
               respond_to do |format|
                   format.js {render partial: 'users/details'}
               end
           else
               respond_to do |format|
                  flash.now[:alert] = "The symbol you entered is invalid."
                  format.js {render partial: 'users/details'}
               end
           end
        else
            respond_to do |format|
               flash.now[:alert] = "Please enter a symbol." 
               format.js {render partial: 'users/details'}
            end
        end
        
    end
    
end

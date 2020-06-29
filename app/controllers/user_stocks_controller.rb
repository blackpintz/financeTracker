class UserStocksController < ApplicationController
    def create
        stock = Stock.check_db(params[:ticker])
        if stock.nil?
            stock = Stock.new_lookup(params[:ticker])
            stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash[:notice] = "#{stock.name} has successfully been added to your portfolio."
        redirect_to portfolio_path
    end
    
    def destroy
        stock = Stock.find(params[:id])
        @foundStock = UserStock.where(stock_id: stock.id, user_id: current_user.id).first
        @foundStock.destroy
         flash[:notice] = "#{stock.name} was deleted from your portfolio."
        redirect_to portfolio_path
    end
end

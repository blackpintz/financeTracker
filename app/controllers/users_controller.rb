class UsersController < ApplicationController
    def portfolio
      @logged_user_stocks = current_user.stocks 
    end
end

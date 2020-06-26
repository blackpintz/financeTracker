class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
 def count_stocks?
    stocks.count <= 10
 end
 
 def available_stock?(ticker_sym)
   stock = Stock.check_db(ticker_sym)
   return stocks.where(id: stock.id).exists? unless stock.nil?
    false
 end
 
 def check_restrictions?(ticker_sym)
   count_stocks? || available_stock?(ticker_sym)
 end
end

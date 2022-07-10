class User < ApplicationRecord
  include Pay::Billable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products

  has_many :sold_orders, foreign_key: "seller_id", class_name: "Order"
  has_many :brought_orders, foreign_key: "buyer_id", class_name: "Order"

 
end

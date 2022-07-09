class Order < ApplicationRecord
  belongs_to :product
  belongs_to :seller, foreign_key: "buyer_id", class_name: "User"
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User"
end

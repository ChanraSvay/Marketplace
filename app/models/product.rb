class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_rich_text :description

  enum condition: {
    new: 1,
    used: 2
  }
end

class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_rich_text :description

  enum condition: {
    new_item: 1,
    used_item: 2
  }
end

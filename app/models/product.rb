class Product < ApplicationRecord
  # mount_uploader :picture, PictureUpLoader
  belongs_to :user
  belongs_to :category
  has_rich_text :description
  has_one_attached :picture

  scope :listing, -> { order created_at: :desc }

  enum condition: {
    new_item: 1,
    used_item: 2
  }
end

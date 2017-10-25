class Product < ApplicationRecord


# アソシエーション
  has_many :reviews

  mount_uploader :productImage, ImageUploader
end

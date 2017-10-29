class Product < ApplicationRecord


# アソシエーション
  has_many :reviews
  has_many :favproducts, dependent: :destroy

  mount_uploader :productImage, ImageUploader
end

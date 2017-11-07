class Product < ApplicationRecord


# アソシエーション
  has_many :reviews, dependent: :destroy
  has_many :favproducts, dependent: :destroy
  has_many :watchproducts, dependent: :destroy

  # 本当はアソシエーションしたいけど、likereviewが使えなくなる...
  # has_many :likereviews, through: :reviews

  mount_uploader :productImage, ImageUploader
end

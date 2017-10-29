class Review < ApplicationRecord


# アソシエーション
  belongs_to :user
  belongs_to :product


  mount_uploader :reviewImage, ReviewImageUploader

  validates :rate, numericality: {
            only_integer: true,
            greater_than_or_equal_to: 0,
            less_than_or_equal_to: 100
          }

end

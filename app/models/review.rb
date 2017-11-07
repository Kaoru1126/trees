class Review < ApplicationRecord

  validates :rate, numericality: {
            only_integer: true,
            greater_than_or_equal_to: 0,
            less_than_or_equal_to: 100
          }

  mount_uploader :reviewImage, ReviewImageUploader

# アソシエーション
  belongs_to :user
  belongs_to :product, counter_cache: :review_counts
  has_many :likereviews, dependent: :destroy

end

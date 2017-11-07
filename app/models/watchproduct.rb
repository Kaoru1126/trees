class Watchproduct < ApplicationRecord
  validates :user_id,      presence: true
  validates :product_id,  presence: true
  validate :prohibit_double_watch_product

  def prohibit_double_watch_product
    if Watchproduct.where(user_id: user_id, product_id: product_id).exists?
      errors.add(:prohibit_same_records, ": 追加ずみです")
    end
  end

  #アソシエーション
  belongs_to :user
  belongs_to :product, counter_cache: :watch_counts
end
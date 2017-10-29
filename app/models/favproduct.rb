class Favproduct < ApplicationRecord
  validates :user_id,      presence: true
  validates :product_id,  presence: true
  # validate :prohibit_double_fav_product

  # 後で中身編集
  # def prohibit_double_fav_product
  #   if Relation.where(user_id: user_id, following_id: following_id).exists?
  #     errors.add(:prohibit_same_records, ": フォローずみです")

  #   end
  # end

  #アソシエーション
  belongs_to :user
  belongs_to :product, counter_cache: :fav_counts

end

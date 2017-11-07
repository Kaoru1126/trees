class Likereview < ApplicationRecord
    validates :user_id,      presence: true
    validates :review_id,  presence: true

  #アソシエーション
  belongs_to :user
  belongs_to :review, counter_cache: :likereviews_counts

  # 本当はアソシエーションしたいけど、likereviewが使えなくなる...
  # belongs_to :product

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # アソシエーション
  has_many :reviews
  has_many :favproducts
  has_many :watchproducts
  has_many :likereviews

  #アップローダー
  mount_uploader :avatar, AvatarUploader

end

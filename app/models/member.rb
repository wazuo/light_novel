class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :mangas, dependent: :destroy
  has_many :manga_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id",dependent: :destroy
  # 自分がフォロー（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "followers_id",dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships ,source: :follower
  与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings,through: :relationships, source: :followed
end

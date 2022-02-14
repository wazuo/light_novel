class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :mangas, dependent: :destroy
  has_many :manga_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end

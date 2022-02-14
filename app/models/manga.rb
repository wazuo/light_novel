class Manga < ApplicationRecord
  attachment :image
  belongs_to :member
  has_many :manga_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
end

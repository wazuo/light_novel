class Manga < ApplicationRecord
  attachment :image
  belongs_to :member
  has_many :manga_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # バリデーション機能
  validates :title, presence: true
  validates :review, presence: true
  validates :impression, presence: true
  validates :introduction, presence: true

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end

  # 検索メソッド定義
  def self.search_for(content, method)
    case method
    when 'perfect'
      # 完全一致
      Manga.where(title: content)
    when 'forward'
      # 前方一致
      Manga.where('title LIKE ?', "#{content}%")
    when 'backward'
      # 後方一致
      Manga.where('title LIKE ?', "%#{content}")
    else
      # 部分一致
      Manga.where('title LIKE ?', "%#{content}%")
    end
  end
end

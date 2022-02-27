class MangaComment < ApplicationRecord
  belongs_to :member
  belongs_to :manga

  # バリデーション機能
  validates :comment, presence: true
end

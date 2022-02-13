class Manga < ApplicationRecord
  attachment :image
  belongs_to :member
  has_many :manga_comments, dependent: :destroy
end

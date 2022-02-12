class Manga < ApplicationRecord
  belongs_to :member
  attachment :image
end

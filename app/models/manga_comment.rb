class MangaComment < ApplicationRecord
  belongs_to :member
  belongs_to :manga
  
end

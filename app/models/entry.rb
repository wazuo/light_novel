class Entry < ApplicationRecord
  # DMのアソシエーション（複数のチャットルームを持つための）
  belongs_to :member
  belongs_to :room
end

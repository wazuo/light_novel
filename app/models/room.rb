class Room < ApplicationRecord
  # DMのアソシエーション
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
end

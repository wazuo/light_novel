class Message < ApplicationRecord
  # DMのアソシエーション(メッセージを送るための中間)
  belongs_to :member
  belongs_to :room
end

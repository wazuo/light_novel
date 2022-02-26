class Relationship < ApplicationRecord
  # フォローする会員
  belongs_to :follower, class_name: 'Member'
  # フォローされる会員のid
  belongs_to :followed, class_name: 'Member'
end

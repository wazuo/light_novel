class Relationship < ApplicationRecord
  # フォローする会員
  belongs_to :follwer, class_name: "Member"
  # フォローされる会員のid
  belongs_to :follwed, class_name: "Member"
# 会員のフォローのメソッド定義
  def follow(member_id)
    relationships.create(followed_id: member_id)
  end
  # 会員のフォローを外すメソッド定義
  def unfollow(member_id)
    relationships.find_by(followed_id: member_id).destroy
  end
  # 会員がフォローしているユーザーの一覧を表すメソッド定義
  def following?(member)
    followings.include?(member)
  end
end
class Contact < ApplicationRecord
  # お問い合わせ機能
  enum subject: { manga: 0, message: 1,review: 2, follower: 3, other: 4 }
  
  # バリデーション機能
  validates :name, :phone_number, :email, :message,presence: true
end

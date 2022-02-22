class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :mangas, dependent: :destroy
  has_many :manga_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # DMのアソシエーション
  has_many :entries,dependent: :destroy
  has_many :messages,dependent: :destroy
  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id",dependent: :destroy
  # 自分がフォロー（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id",dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings,through: :relationships, source: :followed


  # バリデーション機能
  # 新規投稿
  validates :first_name, :last_name, :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\p{katakana}/,message: "全角カタカナのみが使えます"}

  # 会員のフォローのメソッド定義
  def follow(member_id)
     relationships.create(followed_id: member_id)
    #relationship = relationships.new(followed_id: member_id)
    #relationship.save!
  end
  # 会員のフォローを外すメソッド定義
  def unfollow(member_id)
    relationships.find_by(followed_id: member_id).destroy
  end
  # 会員がフォローしているユーザーの一覧を表すメソッド定義
  def following?(member)
    followings.include?(member)
  end

  # 検索メソッド定義
  def self.search_for(content,method)
    if method == 'perfect'
      # 完全一致
      Member.where(nickname: content)
    elsif method == 'forward'
      # 前方一致
      Member.where('nickname LIKE ?', content+'%')
    elsif method == 'backward'
      # 後方一致
      Member.where('nickname LIKE ?','%' + content)
    else
      # 部分一致
      Member.where('nickname LIKE ?', '%' + content + '%')
    end
  end
  def active_for_authentication?
    super && (is_deleted == false)
  end
end

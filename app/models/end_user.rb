class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy

  #自分がフォローしているユーザーとの関連
  #自分から見て、フォローされる側のEndUserを(中間テーブルを介して)集める。なので親はfollowed_id(フォローする側)
  has_many :active_relationships, class_name: "FollowFollower", foreign_key: "followed_id", dependent: :destroy
  # 中間テーブルを介してUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :followed

  #自分がフォローされるユーザーとの関連
  #フォローされる側のEndUserから見て、フォローしてくる側のEndUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "FollowFollower", foreign_key: "follower_id", dependent: :destroy
  #中間テーブルを介してEndUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :follower


  has_one_attached :image

  validates :display_name, uniqueness: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.display_name = "ゲスト"
      user.first_name = "ゲスト"
      user.last_name = "ゲスト"
      user.first_kana = "ゲスト"
      user.last_kana = "ゲスト"
    end
  end

  def self.looks(word)
    @end_users = EndUser.where('display_name LIKE?', "%#{word}%")
  end

  def not_display_guest
      self.email != 'guest@example.com'
  end

  def follow(user_id)
  end


end

class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy

  has_many :active_relationships, class_name: "FollowFollower", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "FollowFollower", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :followed

  has_many :likes, dependent: :destroy


  has_one_attached :image

  validates :display_name, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana, presence: true
  validates :last_kana, presence: true

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

  def follow(end_user_id)
    active_relationships.new(follower_id: end_user_id)
  end

  def unfollow(end_user_id)
    active_relationships.find_by(follower_id: end_user_id).destroy
  end

  def liked_by?(id, post_id)
    Like.where(table_id: post_id, end_user_id: id).present?
  end

  def post_like(id)
    Like.where(table_type: "Post", end_user_id: id)
  end

  def comment_like(id)
    Like.where(table_type: "Comment", end_user_id: id)
  end

  def reply_like(id)
    Like.where(table_type: "Reply", end_user_id: id)
  end


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_profile_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end

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

  validates :display_name, uniqueness: true, presence: true, length: { minimum: 1, maximum: 12}
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

  def hide_non_cancelled_users
    self.is_deleted == false
  end

  def follow(end_user_id)
    active_relationships.new(follower_id: end_user_id)
  end

  def unfollow(end_user_id)
    active_relationships.find_by(follower_id: end_user_id).destroy
  end

  def liked_by?(user_id, id)
    Like.where(table_id: id, end_user_id: user_id).present?
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

  def likes_count
    uncancelled_user_likes = []
    self.likes.each do |like|
      uncancelled_user_likes << like if like.end_user.is_deleted == false
      #binding.pry
    end

    if uncancelled_user_likes.present?
      uncancelled_user_likes.count
    else
      0
    end
  end

  def followers_count
    uncancelled_user_followers = []
    self.followers.each do |follower|
      uncancelled_user_followers << follower if follower.is_deleted == false
      #binding.pry
    end

    if uncancelled_user_followers.present?
      uncancelled_user_followers.count
    else
      0
    end
  end

  def followings_count
    uncancelled_user_follows = []
    self.followings.each do |follow|
      uncancelled_user_follows << follow if follow.is_deleted == false
      #binding.pry
    end

    if uncancelled_user_follows.present?
      uncancelled_user_follows.count
    else
      0
    end
  end


end

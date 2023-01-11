class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy

  has_one_attached :image

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

end

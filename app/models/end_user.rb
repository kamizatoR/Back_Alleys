class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end

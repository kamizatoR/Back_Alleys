class Post < ApplicationRecord
  belongs_to :end_user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :table, dependent: :destroy

  has_one_attached :image

  validates :body, presence: true

  def end_user_deleted?(resource)
    self.end_user.is_deleted != ture
  end

  def self.looks(word)
    @post = Post.where('body LIKE?', "%#{word}%")
  end
end

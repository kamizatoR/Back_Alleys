class Post < ApplicationRecord
  belongs_to :end_user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :table, dependent: :destroy
  has_many :week_likes, ->{ where(created_at: (Time.current.beginning_of_day - 7.days)..) }, as: :table, class_name: 'Like'
  scope :published, -> { joins(:end_user).where(end_users: { is_deleted: false} ) }
  scope :week_rankings, ->{ published.joins(:week_likes).group(:id).order("count(table_id) desc")}

  has_one_attached :image

  validates :body, presence: true

  def end_user_deleted?(resource)
    self.end_user.is_deleted != ture
  end

  def self.looks(word)
    @post = Post.where('body LIKE?', "%#{word}%")
  end

  def comment_count
    uncancelled_user_comments = []

    self.comments.each do |comment|
      uncancelled_user_comments << comment if comment.end_user.is_deleted == false
      #binding.pry
    end

    if uncancelled_user_comments.present?
      uncancelled_user_comments.count
    else
      0
    end

  end
end

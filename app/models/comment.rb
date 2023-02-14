class Comment < ApplicationRecord
  belongs_to :end_user
  belongs_to :post
  has_many :replies, dependent: :destroy
  has_many :likes, as: :table, dependent: :destroy

  validates :body, presence: true

  def reply_count
    uncancelled_user_replies = []
    
    self.replies.each do |reply|
      uncancelled_user_replies << reply if reply.end_user.is_deleted == false
      #binding.pry
    end

    if uncancelled_user_replies.present?
      uncancelled_user_replies.count
    else
      0
    end
    
  end
end

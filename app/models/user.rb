class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def recent_three_posts
    Post.where(user_id: id).order(updated_at: :desc).limit(3)
  end
end

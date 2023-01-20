class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id
  belongs_to :author, class_name: 'User'
  before_save :posts_counter

  def update_posts_counter
    User.find(user_id).increment!(:posts_counter)
  end

  # A method which returns the 5 most recent comments for a given post.
  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end

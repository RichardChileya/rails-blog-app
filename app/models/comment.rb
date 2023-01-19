class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter
    Post.find(post_id).increment!(:comments_counter)
  end
end

require 'rails_helper'

RSpec.describe 'Posts index ', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Richard',
      photo: 'https://i.imgur.com/9yG7zZT.jpg',
      bio: "I'm working",
      post_counter: 
    )
    visit user_posts_path(@user)
    @first_post = Post.create(author: @user, title: 'Post one', text: 'this is my first post', comments_counter: 0, likes_counter: 26)
    @first_comment = Comment.create(post: @first_post, author: @user, text: 'nice idea')
  end
  it 'displays profile picture' do
    visit user_posts_path(@user)
    expect(page).to have_css('img')
  end
  it 'displays username' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.name)
  end
  it 'displays the number of posts' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.post_counter)
  end
  it 'displays the posts title ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.title)
  end
  it 'displays the body of the posts ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.title)
    expect(page).to have_content(@first_post.text)
  end
  it 'displays the first comment ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_comment.text)
  end
  it 'displays the number of comments ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.comments_counter)
  end
  it 'displays the number of likes for a post ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@first_post.likes_counter)
  end

  it 'redirects post to the show page ' do
    visit user_posts_path(@user)
    click_link('See Post')
    expect(page).to have_content('Posts show method')
  end
end

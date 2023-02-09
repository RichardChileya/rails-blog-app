require 'rails_helper'

RSpec.describe 'User index page', type: :system do
  before(:each) do
    @user = User.create(
      name: 'Ikon',
      photo: 'https://i.imgur.com/9yG7zZT.jpg',
      bio: 'I love basketball',
      post_counter: 2
    )
    visit users_path
  end

  it 'shows username of all other users' do
    visit users_path
    expect(page).to have_content(@user.name)
  end

  it 'should show the profile picture for each user' do
    visit users_path
    expect(page).to have_css("img[src*='https://i.imgur.com/9yG7zZT.jpg']")
  end

  it 'should show the number of posts each user has written' do
    visit users_path
    expect(page).to have_content(@user.post_counter)
  end

  it 'should redirect to user show page when clicked' do
    visit users_path
    click_link(@user.name)
    expect(page).to have_content('Users show method')
  end
end

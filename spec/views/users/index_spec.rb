require 'rails_helper'

RSpec.describe 'users index page', type: :feature do
  before(:example) do
    @user1 = User.create(
      name: 'User1',
      photo: 'user1.jpg',
      bio: 'Software Engineer based in Nairobi, Kenya',
      posts_counter: 2
    )

    @user2 = User.create(
      name: 'User2',
      photo: 'user2.jpg',
      bio: 'Software Engineer based in Helsinki, Finland',
      posts_counter: 5
    )

    visit users_path
    # sleep(5)
  end

  it 'displays username for all users' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  it 'displays profile picture for each user' do
    within "#user-#{@user1.id}" do
      expect(page).to have_css("img[src*='user1']")
    end
    within "#user-#{@user2.id}" do
      expect(page).to have_css("img[src*='user2']")
    end
  end

  it 'displays number of posts for each user' do
    within "#user-#{@user1.id}" do
      expect(page).to have_content('Number of posts: 2')
    end
    within "#user-#{@user2.id}" do
      expect(page).to have_content('Number of posts: 5')
    end
  end

  it 'redirects to user show page when clicking on a user' do
    click_link "user-#{@user1.name}-#{@user1.id}"
    expect(current_path).to eq(user_path(@user1))
  end
end

require 'rails_helper'

RSpec.describe 'users show page', type: :feature do
  before(:example) do
    @user = User.create(
      name: 'User1',
      photo: 'user1.jpg',
      bio: 'Software Engineer based in Nairobi, Kenya',
      posts_counter: 0
    )

    5.times.collect do |i|
      Post.create(
        title: "my title #{i}",
        text: 'Hello World!',
        comments_counter: 0,
        likes_counter: 0,
        author_id: @user.id
      )
    end

    visit user_path(@user)
  end

  it "shows the user's profile picture" do
    expect(page).to have_css("img[src*='user1']")
  end

  it "shows the user's username" do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 5')
  end

  it "shows the user's bio" do
    expect(page).to have_content(@user.bio)
  end

  it "shows the user's first 3 posts" do
    first_three_posts = @user.posts[0..2]
    first_three_posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  it "shows a button that lets me view all of a user's posts" do
    expect(page).to have_link('See all posts', href: user_posts_path(@user))
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    first_post = @user.posts.first

    find('a', text: first_post.title.to_s).click
    expect(current_path).to match user_post_path(@user, first_post)
  end

  scenario "When I click to see all posts, it redirects me to the user's post's index page" do
    click_link 'See all posts'
    expect(current_path).to eq user_posts_path(@user)
  end
end

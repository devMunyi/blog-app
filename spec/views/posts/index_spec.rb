require 'rails_helper'
RSpec.describe 'posts index page/view', type: :feature do
  before(:example) do
    @user = User.create(
      name: 'User1',
      photo: 'user1.jpg',
      bio: 'Software Engineer based in Nairobi, Kenya',
      posts_counter: 2
    )
    @posts = 5.times.collect do |i|
      Post.create(
        title: "title of post #{i + 1}",
        text: 'Hello World!',
        comments_counter: 0,
        likes_counter: 0,
        author_id: @user.id
      )
    end
    @post = @posts.first
    7.times.collect do
      Comment.create(
        post_id: @post.id,
        author_id: @user.id,
        text: 'My comment text'
      )
    end
    visit user_posts_path(@user)
  end
  it 'shows user\'s profile picture' do
    expect(page).to have_css("img[src*='user1']")
  end
  it 'shows he user\'s username' do
    expect(page).to have_content(@user.name)
  end
  it 'shows the number of posts the user has written' do
    expect(page).to have_content('Number of posts: 7')
  end
  it 'shows a post\'s title' do
    # first_post = @posts.first
    title = @post.title
    expect(page).to have_content(title)
  end
  it 'shows some of the post\'s body' do
    first_post = @user.posts.first
    expect(page).to have_content(first_post.text.to_s)
  end
  it 'shows first comments on a post' do
    expect(page).to have_content(@post.comments.first.text)
  end
  it 'shows how many comments a post has' do
    expect(page).to have_content("Comments: #{@post.comments_counter}")
  end
  it 'shows how many likes a post has' do
    expect(page).to have_content("Likes: #{@post.likes_counter}")
  end
  it 'shows section for pagination if there are more posts than fit on the view' do
    within '.pagination' do
      expect(page).to have_content('') if @user.posts.count < 10
      expect(page).to have_content('1') if @user.posts.count > 10
    end
  end
  scenario 'when user click on a post, it redirects to that post\'s show page' do
    click_link @post.title.to_s
    expect(current_path).to eq(user_post_path(@user, @post))
  end
end
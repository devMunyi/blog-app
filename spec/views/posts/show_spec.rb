require 'rails_helper'
RSpec.describe 'posts show page/view', type: :feature do
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
    @comments = 7.times.collect do
      Comment.create(
        post_id: @post.id,
        author_id: @user.id,
        text: 'My comment text'
      )
    end
    visit user_post_path(@user, @post)
  end
  it 'shows the post\'s title' do
    expect(page).to have_content(@post.title)
  end
  it 'shows who wrote the post' do
    expect(page).to have_content(@post.author.name)
  end
  it 'shows how many comments it has' do
    expect(page).to have_content('Comments: 7')
  end
  it 'shows how many likes it has' do
    expect(page).to have_content('Likes: 0')
  end
  it 'shows the post body' do
    expect(page).to have_content(@post.text)
  end
  it 'shows the username of each commentor' do
    @comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end
  it 'shows comment each commentor left' do
    @comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
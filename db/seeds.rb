User.create(name: "Sam Munyi", email: 'samunyi90@gmail.com', photo: "https://cdn.dribbble.com/users/9685/screenshots/997495/avatarzzz.gif", bio: "Pianist enthusiast and tech hobbyist.", password: '654321', role: 'admin')
User.create(name: "John Doe", email: 'johndoe@gmail.com', photo: "user1.jpg", bio: "Just a regular guy who likes to write.", password: '123456')
User.create(name: "Jane Smith", email: 'janesmith@gmail.com', photo: "user2.jpg", bio: "Lover of books and coffee.", password: '123456')
User.create(name: "Bob Johnson", email: 'bonjohnson@gmail.com', photo: "user3.jpg", bio: "Food blogger and home cook.", password: '123456')
User.create(name: "Michael Davis", email: 'michaeldavis@gmail.com', photo: "user4.jpg", bio: "Tech enthusiast and coding hobbyist.", password: '123456')
User.create(name: "Samantha Doe", email: 'samanthadoe@gmail.com', photo: "user5.jpg", bio: "Pianist enthusiast and tech hobbyist.", password: '123456')

users = User.where.not(role: 'admin')

users.each do |user|
  7.times do |i|
    post = user.posts.create(title: "Post #{i+1}", text: "This is the text for post #{i+1}.")
    5.times do |j|
      post.likes.create(author_id: User.all.sample.id)
    end
    7.times do |j|
      post.comments.create(text: "This is a comment for post #{i+1}.", author_id: User.all.sample.id)
    end
  end
end

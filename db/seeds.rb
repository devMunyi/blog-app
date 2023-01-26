User.create(name: "John Doe", photo: "user1.jpg", bio: "Just a regular guy who likes to write.")
User.create(name: "Jane Smith", photo: "user2.jpg", bio: "Lover of books and coffee.")
User.create(name: "Bob Johnson", photo: "user3.jpg", bio: "Food blogger and home cook.")
User.create(name: "Michael Davis", photo: "user4.jpg", bio: "Tech enthusiast and coding hobbyist.")
User.create(name: "Samantha Doe", photo: "user5.jpg", bio: "Pianist enthusiast and tech hobbyist.")

users = User.all

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

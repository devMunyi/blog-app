User.create(name: "John Doe", photo: "https://example.com/john_doe.jpg", bio: "Just a regular guy who likes to write.")
User.create(name: "Jane Smith", photo: "https://example.com/jane_smith.jpg", bio: "Lover of books and coffee.")
User.create(name: "Bob Johnson", photo: "https://example.com/bob_johnson.jpg", bio: "Outdoor enthusiast and amateur photographer.")
User.create(name: "Samantha Brown", photo: "https://example.com/samantha_brown.jpg", bio: "Food blogger and home cook.")
User.create(name: "Michael Davis", photo: "https://example.com/michael_davis.jpg", bio: "Tech enthusiast and coding hobbyist.")

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

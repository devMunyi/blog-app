class Post < ApplicationRecord
  # associations
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # validations
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :increment_author_posts_counter

  def five_recent_comments
    comments.includes(:author).order(id: :desc).limit(5)
  end

  private

  def increment_author_posts_counter
    author.increment!(:posts_counter)
  end
end

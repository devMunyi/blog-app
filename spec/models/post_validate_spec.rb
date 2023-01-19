require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(
      title: 'Hello',
      text: 'This is my first post',
      author_id: 1
    )
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'title must not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).not_to be_valid
  end

  context 'comments_counter' do
    it 'value must be an integer greater than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).not_to be_valid

      subject.comments_counter = -10
      expect(subject).not_to be_valid
    end

    it 'should not be non-numeric value' do
      subject.comments_counter = 'comment'
      expect(subject).not_to be_valid
    end
  end

  context 'likes_counter' do
    it 'value must be an integer greater than or equal to zero' do
      subject.likes_counter = -1
      expect(subject).not_to be_valid

      subject.likes_counter = -10
      expect(subject).not_to be_valid
    end

    it 'should not be non-numeric value' do
      subject.likes_counter = 'comment'
      expect(subject).not_to be_valid
    end
  end
end

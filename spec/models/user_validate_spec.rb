require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Sam',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'A software developer based in Kenya'
    )
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  context 'posts_counter' do
    it 'value must be an integer greater than or equal to zero' do
      subject.posts_counter = -1
      expect(subject).not_to be_valid
    end

    it 'should not be non-numeric value' do
      subject.posts_counter = 'post'
      expect(subject).not_to be_valid
    end
  end
end

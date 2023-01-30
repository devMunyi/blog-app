require 'rails_helper'

RSpec.describe User, type: :request do
  let(:user) do
    User.create(
      name: 'Sam',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'A software developer based in Kenya',
      posts_counter: 0
    )
  end

  context 'GET #index' do
    before(:example) { get users_path } # get(:index)

    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end

    context 'index template' do
      it 'is rendered' do
        expect(response).to render_template('index')
      end

      it 'has response body that includes correct placeholder text' do
        expect(response.body).to include('Users')
      end
    end
  end

  context 'GET #show' do
    before(:example) { get user_path(user) } # get(:show)

    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end

    context 'show template' do
      it 'is rendered' do
        expect(response).to render_template('show')
      end

      it 'has response body that includes correct placeholder text' do
        expect(response.body).to include('User Details')
      end
    end
  end
end

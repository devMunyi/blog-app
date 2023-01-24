require 'rails_helper'

RSpec.describe Post, type: :request do
  context 'GET #index' do
    before(:example) { get user_posts_path(1) } # get(:index)

    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end

    context 'index template' do
      it 'is rendered' do
        expect(response).to render_template('index')
      end

      it 'has response body that include the correct placeholder text' do
        expect(response.body).to include('List of posts for a given author goes here')
      end
    end
  end

  context 'GET #show' do
    before(:example) { get user_post_path(1, 1) } # get(:index)

    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end

    context 'show template' do
      it 'is rendered' do
        expect(response).to render_template('show')
      end

      it 'has response body that includes correct placeholder text' do
        expect(response.body).to include('Details for a specific post by a particular author goes here')
      end
    end
  end
end

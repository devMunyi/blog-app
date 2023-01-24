require 'rails_helper'

RSpec.describe User, type: :request do
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
        expect(response.body).to include('List of users goes here')
      end
    end
  end

  context 'GET #show' do
    before(:example) { get user_path(1) } # get(:show)

    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end

    context 'show template' do
      it 'is rendered' do
        expect(response).to render_template('show')
      end

      it 'has response body that includes correct placeholder text' do
        expect(response.body).to include('Details of a given user goes here')
      end
    end
  end
end

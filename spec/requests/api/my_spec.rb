require 'swagger_helper'

RSpec.describe 'api/endpoints', type: :request, host: 'http://localhost:3000' do

  path '/api/users/{user_id}/posts' do
    get 'list posts for a specific user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string

      response '200', 'posts found' do

        let(:user_id) { 2 }
        run_test!
      end

      response '404', 'blog not found' do
        let(:user_id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end

  path '/api/users/{user_id}/posts/{post_id}/comments' do
    get 'list user\'s post comments' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :post_id, in: :path, type: :string

      response '200', 'comments found' do
        schema type: :array,
          items: {
          type: :object,
          properties: {
            id: { type: :integer },
            text: { type: :string },
            author_id: { type: :integer },
            created_at: { type: :string, format: :'date-time' },
            updated_at: { type: :string, format: :'date-time' }
          },
            required: [ 'id', 'text', 'author_id']
          }

          let(:user_id) { 2 }
          let(:post_id) { 1 }
          run_test!
      end

      response '404', 'blog not found' do
        let(:user_id) { 'invalid' }
        let(:post_id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end

  path '/api/users/2/posts/1/comments' do

    post 'Add a comment to a post' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string
      parameter name: :post_id, in: :path, type: :string
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: [ 'title', 'user_id', 'post_id' ]
      }

      response '201', 'blog created' do
        let(:comment) { { text: 'foo', user_id: 2, post_id: 11 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { text: 'foo', user_id: 'invalid', post_id: 'invalid' } }
        run_test!
      end
    end
  end
end

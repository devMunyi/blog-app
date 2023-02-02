class Api::PostsController < Api::ApplicationController
  before_action :incoming_author, only: [:index]

  def index
    posts = @author.posts
    render json: posts, status: :ok
  end

  # callbacks method to be used by controller methods or actions
  private

  def incoming_author
    @author = User.find(params[:user_id])
  end
end

class Api::CommentsController < Api::ApplicationController
  before_action :incoming_post
  def index
    comments = @post.comments
    render json: comments, status: :ok
  end


  private

  def incoming_post
    @post = Post.find(params[:post_id])
  end
end

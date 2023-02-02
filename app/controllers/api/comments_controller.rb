class Api::CommentsController < Api::ApplicationController
  before_action :incoming_post
  def index
    comments = @post.comments
    render json: comments, status: :ok
  end

  def create
    # should use currently logged in user
    @comment = Comment.new(author_id: params[:user_id], post_id: params[:post_id], **comment_params)

    if @comment.save
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def incoming_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end

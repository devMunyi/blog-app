class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    comment = Comment.new(**comment_params, author_id: current_user.id, post_id: params[:post_id])

    if comment.save
      flash[:success] = 'Comment added successfully'
      redirect_to user_post_path(current_user.id, params[:post_id])
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

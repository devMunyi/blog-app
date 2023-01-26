class PostsController < ApplicationController
  def index
    author_id = posted_by
    @user = User.find(author_id)
    @posts = Post.where(author_id:)
  end

  def show
    author_id = posted_by
    post_id = params[:id]
    @user = User.find(author_id)
    @post = Post.includes(:comments).where(id: post_id, author_id:).order('comments.id DESC').first
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(**post_params, author_id: current_user.id)

    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def posted_by
    params[:user_id]
  end
end

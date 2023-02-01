class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    author_id = posted_by
    @user = User.find(author_id)
    @pagy, @posts = pagy(@user.posts.includes(:comments).order('posts.id DESC').order('comments.id DESC').limit(5),
                         items: 10)
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
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to user_posts_path, notice: 'Post was successfully destroyed.'
    else
      flash.now[:error] = 'Error: Post could not be deleted'
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

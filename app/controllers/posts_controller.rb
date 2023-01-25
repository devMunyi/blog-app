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
    @post = Post.includes(:comments).where(id: post_id, author_id:).order('id DESC').first
  end

  private

  def posted_by
    params[:user_id]
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all.order('id ASC')
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end

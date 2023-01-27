class ApplicationController < ActionController::Base
  include Pagy::Backend

  def current_user
    @user = User.first
  end
end

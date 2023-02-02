class Api::ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  respond_to :json
end

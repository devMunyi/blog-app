module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
  end

  private

  def not_found_response(err)
    json_response({ message: err.message }, :not_found)
  end

  def unprocessable_entity_response(err)
    json_response({ message: err.message }, :unprocessable_entity)
  end
end

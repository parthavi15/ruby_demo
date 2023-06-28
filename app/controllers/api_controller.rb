# frozen_string_literal: true

#:nodoc:
class ApiController < ActionController::API
  include Response

  respond_to :json
end

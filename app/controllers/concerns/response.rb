# frozen_string_literal: true

#:nodoc:
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def response_with_message(status, message)
    {
      status: status,
      message: message
    }
  end

  def response_with_id(status, message, id)
    {
      status: status,
      message: message,
      id: id
    }
  end

  def redirect_response(url)
    redirect_to url, status: :found
  end

  def error_response(
    status_code = 400,
    message = I18n.translate('api.responses.error_response'),
    status = I18n.translate('api.responses.error')
  )
    render json: response_with_message(status, message), status: status_code
  end

  def successful_response(message)
    render json: response_with_message(
      I18n.translate('api.responses.success'), message
    ), status: :ok
  end

  def successful_put(
    message = I18n.translate('api.responses.successful_put'),
    status = I18n.translate('api.responses.success')
  )
    render json: response_with_message(status, message), status: :ok
  end

  def successful_post(id,
                      message = I18n.translate('api.responses.successful_post'),
                      status = I18n.translate('api.responses.success'))
    render json: response_with_id(status, message, id), status: :created
  end

  def successful_delete(
    message = I18n.translate('api.responses.successful_delete'),
    status = I18n.translate('api.responses.success')
  )
    render json: response_with_message(status, message), status: :ok
  end

  def unprocessable_entity(message = I18n.translate('api.responses.unprocessable_entity'))
    render json: response_with_message(
      I18n.translate('api.responses.error'), message
    ), status: :unprocessable_entity
  end

  def not_found(message = I18n.translate('api.responses.not_found'))
    render json: response_with_message(
      I18n.translate('api.responses.error'), message
    ), status: :not_found
  end
end

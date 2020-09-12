class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, unless: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :lastname_fullwidth_kanji, :firstname_fullwidth_kanji, \
                                                       :lastname_fullwidth_katakana, :firstname_fullwidth_katakana, :birthday])
  end

  def store_current_location
    store_location_for(:user, request.url)
  end
end

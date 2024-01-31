class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, unless: :devise_controller?

  helper_method :current_company

  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end
end

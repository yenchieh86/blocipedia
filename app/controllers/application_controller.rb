class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  include Pundit
  protect_from_forgery

  private

  def unauthorized
    flash[:alert] = 'You are not authorized to do that'
    redirect_to(request.referrer || root_path)
  end

end

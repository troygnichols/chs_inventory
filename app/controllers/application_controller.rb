class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  private

  def authorize_admin
    head status: :forbidden unless current_user.admin?
  end
end

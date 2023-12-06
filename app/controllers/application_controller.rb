class ApplicationController < ActionController::Base
  skip_forgery_protection

  after_action :verify_authorized, unless: :devise_controller? 
  #after_action :verify_policy_scoped, only: :index, unless: :devise_controller? 
  #skip_after_action :verify_authorized, only: :dashboard

  include Pundit::Authorization 
  before_action :authenticate_user!

rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized 

private 

  def user_not_authorized 
    flash[:alert] = "You are not authorized to perform this action"
    redirect_back(fallback_location: book_path)
  end 
end

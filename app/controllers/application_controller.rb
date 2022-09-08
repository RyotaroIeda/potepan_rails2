class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_search

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def set_search
    @search = Post.ransack(params[:q]) 
    @search_posts = @search.result
  end

end
class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  include Pundit
  
  #disabled application level authentication - to allow engines to implement their own authentication rules.
  #before_action :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :check_set_role_permissions, if: :devise_controller?

  protected

  #this allows us to pass additional parameters through the form (that aren't directly related to the devise model)
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role_id
    devise_parameter_sanitizer.for(:account_update) << :role_id
  end

  # this method will check your role and allow you to set it based on your current role (see users_controller)
  def check_set_role_permissions
  	if params[:controller] == "devise/registrations" && params[:action] == "update"
		if user_signed_in? && !current_user.admin? && params[:role_id].present?
			params[:role_id] = current_user.can_change_to_role?(params[:role_id])
		end

  	end
  end

  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      profile_edit_path
    else
      root_path
    end
  end

end

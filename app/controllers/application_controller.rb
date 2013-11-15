class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Define the layout
  layout :define_layout

  # Check all strong parameter before calling controller
  #   - Check the strong parameters for all our controllers. Each controller must have its own 'my_controller'_params method
  before_filter do
    # Check Strong parameters for each Controller
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  private
  def define_layout
    # Display different depending on the user (connected or not)
    if user_signed_in?
      'registered_user'
    else
      'guest_user'
    end
  end

  def after_sign_in_path_for(user)
    if user.role and user.role.name == 'admin' 
      loans_path
    else
      comics_path
    end
  end
end

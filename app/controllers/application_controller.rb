class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Define the layout
  layout :define_layout


  private
  def define_layout
    # Display different depending on the user (connected or not)
    if user_signed_in?
      'registered_user'
    else
      'guest_user'
    end
  end
end

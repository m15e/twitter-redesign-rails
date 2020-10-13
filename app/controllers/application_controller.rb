class ApplicationController < ActionController::Base
  include ApplicationHelper

  helper_method :check_login

  def check_login
    return unless current_user

    redirect_to(login_path)
    flash[:notice] = 'Please login to continue'
  end
end

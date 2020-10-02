class SessionsController < ApplicationController

  def login

  end

  def try_login
    if params[:username].present?
      user_found = User.where(:username => params[:username]).first

      if user_found
        session[:user_id] = user_found.id
        flash[:notice] = 'Logged in'
        redirect_to(users_path)
      else 
        flash.now[:notice] = 'user does not exist'
        render('login')
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(sessions_login_path)
  end
end
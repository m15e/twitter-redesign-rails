class SessionsController < ApplicationController

  def login
  end

  def try_login
    if params[:username].present?
      user_found = User.where(:username => params[:username]).first

      if user_found
        session[:user_id] = user_found.id
        session[:username] = user_found.username
        session[:name] = user_found.full_name 
        session[:photo] = url_for(user_found.photo)
        session[:followeds] = user_found.followeds.count
        session[:followers] = user_found.followers.count
        flash[:notice] = 'Logged in'
        redirect_to(sources_path)
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
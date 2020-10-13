class SessionsController < ApplicationController
  def login
    session[:photo] = 'profile.png'
  end

  def try_login
    return unless params[:username].present?

    user_found = User.where(username: params[:username]).first

    if user_found
      photo = user_found.photo.attached? ? url_for(user_found.photo) : 'profile.png'

      session[:user_id] = user_found.id
      session[:username] = user_found.username
      session[:name] = user_found.full_name
      session[:photo] = photo
      session[:followeds] = user_found.followeds.count
      session[:followers] = user_found.followers.count
      flash[:notice] = 'Logged in'
      redirect_to(sources_path)
    else
      flash.now[:notice] = 'user does not exist'
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(sessions_login_path)
  end
end

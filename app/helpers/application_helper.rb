module ApplicationHelper
  def current_user
    session[:user_id]
  end

  def profile_img(user)
    user.photo.attached? ? url_for(user.photo) : 'profile.png'
  end
end

module ApplicationHelper
  def current_user
    session[:user_id]
  end

  def profile_img(user)
    user.photo.attached? ? url_for(user.photo) : 'profile.png'
  end

  def destroy_comment(comment)
    return unless comment.user_id == current_user

    link_to 'Destroy', comments_destroy_path(comment_id: comment.id), method: :delete, class: 'destroy-comment'
  end
end

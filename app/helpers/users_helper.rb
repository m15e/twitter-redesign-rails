module UsersHelper
  def user_index_links(user)
    content = tag(:div, class: 'source-author') 
    content << link_to(user.username, user_path(user))
    content << tag(:br)
    if current_user != user.id 
      unless @following.include?(user) 
        content << link_to('Follow', followings_follow_path(follower_id: current_user, followed_id: user.id), method: :post, class: 'follow-link')
      end
      if @following.include?(user)
        content << link_to('Unfollow', followings_unfollow_path(follower_id: current_user, followed_id: user.id), method: :delete, class: 'unfollow-link')
      end
    end
    if user.id == current_user
      content << link_to('Edit', edit_user_path(user))
    end
    content
  end
end
module UsersHelper
  def user_index_links(user)
    content = tag(:div, class: 'source-author') 
    content << link_to(user.username, user_path(user))
    content << tag(:br)
    follow_link(@following, user, content, false)
    if user.id == current_user
      content << link_to('Edit', edit_user_path(user))
    end
    content    
  end

  def follow?(following, user)
    content = tag(:span, class: 'follow-links')
    follow_link(following, user, content, true)
  end

  def follow_img?(following, user)
    content = tag(:span, class: 'follow-img')
    follow_link(following, user, content, false)
  end

  def follow_link(following, user, content, icon)
    link_words = ['Follow', 'Unfollow']
    link_imgs = [image_tag('minus.svg'), image_tag('plus.svg')] 
    txt_img = icon ? link_imgs : link_words 
    if current_user != user.id 
      unless following.include?(user)
        content << link_to(txt_img[0], followings_follow_path(follower_id: current_user, followed_id: user.id), method: :post)
      end
      if @following.include?(user)
        content << link_to(txt_img[1], followings_unfollow_path(follower_id: current_user, followed_id: user.id), method: :delete, class: 'unfollow-link')
      end
    end 
    content
  end
end
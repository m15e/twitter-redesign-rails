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

  def cover_image(user)
    user.cover_image.attached? ? url_for(user.cover_image) : 'cover.jpg'
  end

  def follow?(following, user)
    content = tag(:div, class: 'column user-col')
    follow_link(following, user, content, false)
  end

  def follow_img(following, user)
    content = tag(:div, class: 'column user-col')
    follow_link(following, user, content, true)
  end

  def follow_link(following, user, content, icon)
    link_words = ['Follow', 'Unfollow', 'follow-link_']
    link_imgs = [image_tag('plus.svg'), image_tag('minus.svg'), 'follow-link'] 
    txt_img = icon ? link_imgs : link_words 
    if current_user != user.id 
      unless following.include?(user)
        content << link_to(txt_img[0], followings_follow_path(follower_id: current_user, followed_id: user.id), method: :post, class: txt_img[2])
      end
      if @following.include?(user)
        content << link_to(txt_img[1], followings_unfollow_path(follower_id: current_user, followed_id: user.id), method: :delete, class: txt_img[2])
      end
    end 
    content
  end
end
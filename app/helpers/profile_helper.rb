module ProfileHelper
  def username_updated(username)
    if @profile.username.present?
      @profile.username
    else
      @profile.user.username
    end
  end

  def avatar_attached(avatar)
    if @profile.avatar.attached?
      image_tag @profile.avatar, class:'your_img', id:'avatar_btn'
    else
      image_tag 'default-avatar.png', class:'your_img', id:'avatar_btn'
    end
  end 
end
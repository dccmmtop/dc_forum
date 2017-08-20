module UsersHelper


  include LetterAvatar::AvatarHelper

   def user_avatar_width_for_size(size)
    case size
    when :xs then 16
    when :sm then 32
    when :md then 40
    when :lg then 96
    else size
    end
  end

  def user_avatar_tag(user,version=:md)
    width=user_avatar_width_for_size(version)
    user.avatar ||= letter_avatar_url(user.name,width)
    image_tag user.avatar, class:'img-circle'
  end

end

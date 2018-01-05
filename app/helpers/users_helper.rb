module UsersHelper


  include LetterAvatar::AvatarHelper

   def user_avatar_width_for_size(size)
    case size
    when :xs then 20
    when :sm then 32
    when :md then 40
    when :lg then 96
    when :md2 then 60
    else size
    end
  end

   def user_avatar_self(size)
     p size.to_s
     return size.to_s
   end

   def user_avatar_tag(user,version=:md)
     if user.avatar.url.nil?
       width=user_avatar_width_for_size(version)
       image_tag letter_avatar_url(user.name,width), class:'img-circle'
     else
       image_tag user.avatar, class:"img-circle img-#{user_avatar_self(version)}"
     end
   end

     def nickname_user
       if current_user && (current_user.nickname.nil? || current_user.nickname.size==0)
         current_user.name
       elsif current_user
         current_user.nickname
       end
     end

   end

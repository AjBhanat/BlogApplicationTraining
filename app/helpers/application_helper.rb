module ApplicationHelper
  def check_user(user_id)
    if current_user.id == user_id
      true
    else
      false
    end
  end

  def get_user_name(user_id)
    user = User.find_by_id(user_id)
    user[:email]
  end

  def check_archive(post_status)
    result = (post_status == 'archive')? false : true
  end

end

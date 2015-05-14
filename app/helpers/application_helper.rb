module ApplicationHelper
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end

  def client_or_attorney_from_user(user)
    client_from_user(user) || attorney_from_user(user)
  end

  def client_from_user(user)
    Client.find_by(user_id: user.id)
  end

  def attorney_from_user(user)
    Attorney.find_by(user_id: user.id)
  end

  def privileged
    @user == current_user or current_user.god_mode
  end

end
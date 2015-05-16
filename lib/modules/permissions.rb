module Permissions

  def authenticate_admin
    unless current_user.god_mode
      flash[:error] = "Access denied."
      go_back
    end
  end


  def privileged
    unless @user == current_user or current_user.god_mode
      flash[:error] = "Access denied."
      go_back
    end
  end


  def go_back
    redirect_to :back rescue redirect_to root_path
  end

end
module CustomSpecHelpers
  def deny_access
    redirect_to new_user_session_path
  end
end

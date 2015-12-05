module ApplicationHelper

	def current_user
    if session[:admin]
      @current_user ||= TwitterUser.find_by_id(session[:admin])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end
end

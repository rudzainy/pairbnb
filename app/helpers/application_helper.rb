module ApplicationHelper

	def current_user
		if user.id == session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def display_tags(listing)
		raw listing.tag_list.map { |tag| link_to tag, tag_path(tag)}.join(', ')
	end
end

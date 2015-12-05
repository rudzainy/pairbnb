class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_email(env['omniauth.auth']['extra']['raw_info']['email'])
    user.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
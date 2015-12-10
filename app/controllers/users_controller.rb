class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit]

	def show
	end

	def edit
	end

	def create
		if params[:user][:password] != params[:user][:password_confirmation]
			redirect_to sign_up_path, :notice => "Password does not match!"
		else
	    @user = User.new(permit_params)
	    # @user.name = @name
	    @user.image = "default_avatar.png"

	    if @user.save #(permit_params)
	      sign_in @user

	      # render :json => {:success => true}
	    else
	      # render :json => {:success => false}
	    end
	  end
  end

  private

	  # def user_from_params
	  #   user_params = params[:user] || Hash.new
	  #   @name = params[:user][:name]
	  #   email = user_params.delete(:email)
	  #   password = user_params.delete(:password)
	  #   user_params.delete(:name)
	  #   user_params.delete(:password_confirmation)

	  #   Clearance.configuration.user_model.new(user_params).tap do |user|
	  #     user.email = email
	  #     user.password = password
	  #   end
	  # end

		def find_user
			@user = User.find(params[:id])
		end

	  def permit_params
	    params.require(:user).permit(:name, :email, :encrypted_password, :password, :confirmation_token, :remember_token)
	  end
end
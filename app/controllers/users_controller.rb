class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update]

	def show
	end

	def edit
	end

	def create
		if match_password
	    @user = User.new(permit_params)
	    # @user.name = @name
	    @user.image = "default_avatar.png"

	    if @user.save #(permit_params)
	      sign_in @user

	      # render :json => {:success => true}
	    # else
	    #   render 'new'
	    end
		else
			render 'new'
			# redirect_to sign_up_path, :notice => "Password does not match!"
	  end
  end

  def update
    if @user.update_attributes(permit_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
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

	  def match_password
			true if params[:user][:password] = params[:user][:password_confirmation]
		end
end
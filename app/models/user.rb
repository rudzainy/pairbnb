class User < ActiveRecord::Base
  include Clearance::User

  has_many :authentications, :dependent => :destroy
  # validates :email, uniqueness: true, presence: true

  # def new
  # end

  # def create
  # 	@user = User.create(user_params)
  # 	redirect_to @user 
  # end

  # def update
  # end

  # def destroy
  # end

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.name = auth_hash["info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.image = auth_hash["info"]["image"]
      u.authentications<<(authentication)
    end
  end
  
  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end
  
  def password_optional?
    true
  end

private

		def user_params
			params.require(:user).permit(:name, :email, :password)
		end
end
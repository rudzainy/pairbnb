class User < ActiveRecord::Base
  include Clearance::User
  validates :email, uniqueness: true, presence: true

  def self.omniauth(auth)
    #where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.token = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

end

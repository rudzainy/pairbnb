class SaperateOmniauthAuthenticationFromUsersTable < ActiveRecord::Migration
  def change
  	remove_column :users, :provider
  	remove_column :users, :uid
  	remove_column :users, :token
  	remove_column :users, :expires_at
  end
end

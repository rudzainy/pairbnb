class AddFbOmniauthColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :provider, :string
  	add_column :users, :uid, :string
  	rename_column :users, :first_name, :name
  	add_column :users, :avatar, :string
  	add_column :users, :token, :string
  	add_column :users, :expires_at, :datetime
  end
end

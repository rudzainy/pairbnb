class AddMoreColumnsToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :location, :string
  	add_column :listings, :guest, :integer
  	add_column :listings, :bedroom, :integer
  	add_column :listings, :price, :integer
  	add_column :listings, :images, :string, array: true, default: []
  end
end

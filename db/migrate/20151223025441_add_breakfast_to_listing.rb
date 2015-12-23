class AddBreakfastToListing < ActiveRecord::Migration
  def change
  	add_column :listings, :breakfast, :boolean
  end
end

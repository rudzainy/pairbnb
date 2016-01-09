class Listing < ActiveRecord::Base

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  mount_uploaders :images, ImageUploader

	belongs_to :user
  has_many :reservations, :dependent => :destroy
end

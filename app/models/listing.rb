require 'elasticsearch/model'

class Listing < ActiveRecord::Base

	include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  mount_uploaders :images, ImageUploader

	belongs_to :user
  has_many :reservations, :dependent => :destroy
end

# Listing.__elasticsearch__.create_index!
Listing.import # for auto sync model with elastic search
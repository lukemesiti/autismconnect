class Event < ActiveRecord::Base
  belongs_to :user

  has_many :invites

  # SP 25/02/2014 acts-as-taggable relationship (alias for acts_as_taggable_on :tags)
  # gives access to information inside @events.tags
  acts_as_taggable

  geocoded_by :address
  after_validation :geocode

  mount_uploader :asset, AssetUploader

  scope :mapped_events, -> { where("latitude IS NOT NULL") }

  def to_s
  	self.name
  end
  def abstract
    "A " + self.category + " event scheduled for " + self.dateTime.to_s
  end

end

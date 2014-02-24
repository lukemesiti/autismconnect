class Event < ActiveRecord::Base
  belongs_to :user

  has_many :invites

  # SP 25/02/2014 acts-as-taggable relationship (alias for acts_as_taggable_on :tags)
  # gives access to information inside @events.tags
  acts_as_taggable
end

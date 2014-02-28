class Link < ActiveRecord::Base
  belongs_to :user

  # SP 25/02/2014 acts-as-taggable relationship (alias for acts_as_taggable_on :tags)
  # gives access to information inside @links.tags
  acts_as_taggable

  

  def to_s
  	self.name
  end
  def abstract
  	"Web Link"
  end
end

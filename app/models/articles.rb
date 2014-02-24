class Articles < ActiveRecord::Base
  belongs_to :user

  # SP 24/02/2014 acts-as-taggable relationship (alias for acts_as_taggable_on :tags)
  # gives access to information inside @articles.tags
  acts_as_taggable

end

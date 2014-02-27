class Article < ActiveRecord::Base
  belongs_to :user

  # SP 24/02/2014 acts-as-taggable relationship (alias for acts_as_taggable_on :tags)
  # gives access to information inside @articles.tags
  acts_as_taggable

  # scope :search, {|search_term| 
  # 	if search_term.present?
  # 		where("name ilike ? OR description ilike ?",search_term )
  # 	end
  # }

  def to_s
  	self.title
  end

  def abstract
  	self.body
  end


end

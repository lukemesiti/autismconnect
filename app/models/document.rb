class Document < ActiveRecord::Base
  belongs_to :user
  mount_uploader :asset, AssetUploader

  # acts-as-taggable relationship (alias for acts_as_taggable_on :tags)
  # gives access to information inside @articles.tags
  acts_as_taggable

  def to_s
  	self.name
  end
  def abstract
  	self.kind
  end
end

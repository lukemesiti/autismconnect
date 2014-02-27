class Document < ActiveRecord::Base
  belongs_to :user
  mount_uploader :asset, AssetUploader

  def to_s
  	self.name
  end
  def abstract
  end
end

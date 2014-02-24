class Document < ActiveRecord::Base
  belongs_to :user
  mount_uploader :asset, AssetUploader
end

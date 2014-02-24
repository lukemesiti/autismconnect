class AddAssetToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :asset, :string
  end
end

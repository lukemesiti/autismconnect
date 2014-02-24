class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end

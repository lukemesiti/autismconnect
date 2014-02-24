class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :type
      t.integer :cost
      t.timestamp :dateTime
      t.integer :capacity
      t.string :website
      t.references :user, index: true

      t.timestamps
    end
  end
end

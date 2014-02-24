class ChangeDocumentsTypeToKind < ActiveRecord::Migration
  def change
    change_table :documents do |t|
      t.rename :type, :kind
    end
  end
end

class ChangeSubjectToLocation < ActiveRecord::Migration
  def change
    rename_table :subjects, :locations
    rename_column :items_in_stock, :subject_id, :location_id
  end
end

class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :label_name
      t.integer :label_tag_id

      t.timestamps
    end
  end
end
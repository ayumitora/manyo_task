class CreateLabelTags < ActiveRecord::Migration[5.2]
  def change
    create_table :label_tags do |t|
      t.integer :task_id
      t.integer :label_id

      t.timestamps
    end
    add_foreign_key :label_tags, :tasks, column: :task_id
    add_foreign_key :label_tags, :labels, column: :label_id
  end
end
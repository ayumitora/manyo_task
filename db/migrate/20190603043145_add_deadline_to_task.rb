class AddDeadlineToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :deadline, :datetime,
               null: false, default: "0000-00-00 00:00:00"
  end
end

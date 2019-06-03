class AddStatusToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :status, :string,
               null: false, default: "未入力"
  end
end

class Label < ApplicationRecord
  has_many :label_tags
  has_many :which_tasks, through: :label_tags, source: :task
  #.which_tasksメソッドで、紐づくtaskを呼び出せる
end

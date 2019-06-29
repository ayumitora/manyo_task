class Label < ApplicationRecord
  has_many :label_tags
  has_many :which_tasks, through: :label_tags, source: :task
end

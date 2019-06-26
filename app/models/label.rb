class Label < ApplicationRecord
  has_many :label_tag
  has_many :which_task, through: :label_tags, source: :task
end

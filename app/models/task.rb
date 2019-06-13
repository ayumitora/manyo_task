class Task < ApplicationRecord
  validates :task_name, presence: true
  scope :important, -> {order(priority: :asc)}
  scope :latest, -> {order(created_at: :desc)}
  scope :expired, -> {order(deadline: :asc)}
  scope :search, -> (params) {where('(task_name LIKE ?) AND (status LIKE ?)',
                                  "%#{params[:task][:task_name_key]}%",
                                  "%#{params[:task][:status_key]}%")}

  enum priority: { not_entered: 0, high: 1, medium: 2, low: 3 }

end

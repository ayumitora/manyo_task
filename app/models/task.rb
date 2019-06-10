class Task < ApplicationRecord
  validates :task_name, presence: true

  scope :latest, -> {order(created_at: :desc)}
  scope :expired, -> {order(deadline: :asc)}
  scope :search, -> (params) {where('(task_name LIKE ?) AND (status LIKE ?)',
                                  "%#{params[:task][:task_name_key]}%",
                                  "%#{params[:task][:status_key]}%")}
  # scope :search_by_keyword, -> (keyword) {
  #   where("(orders.name LIKE :keyword) OR (orders.address LIKE :keyword)", keyword: "%#{sanitize_sql_like(keyword)}%") if keyword.present?
  # }
end

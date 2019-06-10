class Task < ApplicationRecord
  validates :task_name, presence: true

  scope :latest, -> {order(created_at: :desc)}
  scope :expired, -> {order(deadline: :asc)}
  scope :search, -> (params) {where('(task_name LIKE ?) AND (status LIKE ?)',
                                  "%#{params[:task][:task_name_key]}%",
                                  "%#{params[:task][:status_key]}%")}

  enum priority: [I18n.t('not_entered'),
                  I18n.t('top'),
                  I18n.t('medium'),
                  I18n.t('low')]
  end

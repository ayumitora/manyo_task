class Task < ApplicationRecord
  validates :task_name, presence: true

  scope :latest, -> {order(created_at: :desc)}
  scope :expired, -> {order(deadline: :asc)}
  scope :search, -> (params) {where('(task_name LIKE ?) AND (status LIKE ?)',
                                  "%#{params[:task][:task_name_key]}%",
                                  "%#{params[:task][:status_key]}%")}
  #
  # enum priority: [
  #   [I18n.t('not_entered'), 0],
  #   [I18n.t('top'), 1],
  #   [I18n.t('medium'),2],
  #   [I18n.t('low'),3]
  # ]

  # enum priority: [
  #   [:'未入力', 0],
  #   [:'高', 1],
  #   [:'中',2],
  #   [:'低',3]
  # ]
  #

  # enum priority: [:no_enterd, :high, :medium, :low]
  #
  # enum priority: [I18n.t('not_entered'), I18n.t('high'), I18n.t('medium'), I18n.t('low')]
  #
  enum priority: { not_entered: 0, high: 1, medium: 2, low: 3 }

  # enum priority: { I18n.t('not_entered'): 0,
  #                  I18n.t('high'): 1,
  #                  I18n.t('medium'): 2,
  #                  I18n.t('low'): 3}

end



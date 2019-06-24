class User < ApplicationRecord
  has_secure_password

  validates :user_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tasks, dependent: :destroy

  before_destroy :do_not_destroy_last_admin

  private

  def do_not_destroy_last_admin
    if User.find(admin?).size == 1
      errors.add :base, '少なくとも1つ、管理者権限のあるアカウントが必要です'
      # return false　ではなく throw :abort
      throw :abort
    end
  end
end

class User < ApplicationRecord
  has_secure_password

  validates :user_name, presence: true
  validates :email, presence: true, uniqueness: true

  before_destroy :do_not_destroy_last_admin
  has_many :tasks, dependent: :destroy


  def do_not_destroy_last_admin
    if self.admin? && User.where(admin: :true).count == 1
      throw :abort
    end
  end
end

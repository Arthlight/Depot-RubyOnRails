class User < ApplicationRecord
  include ModelErrors
  
  validates :name, presence: true, uniqueness: true
  after_destroy :ensure_an_admin_remains
  has_secure_password


  private

  def ensure_an_admin_remains
    if User.count.zero?
      raise NoAdminLeftError, "Can not delete last user"
    end
  end
end

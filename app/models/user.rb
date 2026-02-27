class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Roles
  enum :role, { buyer: 'buyer', admin: 'admin' }

  # Validations
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :role, presence: true

  # Scopes
  scope :admins, -> { where(role: 'admin') }
  scope :buyers, -> { where(role: 'buyer') }

  # Helper methods
  def admin_user?
    role == 'admin'
  end

  def buyer_user?
    role == 'buyer'
  end

  # Override to prevent self-deletion
  def destroy
    raise "Cannot delete the last admin user" if admin? && User.admins.count == 1
    super
  end
end

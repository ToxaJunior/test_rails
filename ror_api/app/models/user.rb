class User < ApplicationRecord

  ROLE_ADMIN = 'admin'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :roles

  def admin?
    self.roles.select { |role| role.name == ROLE_ADMIN}.any?
  end
end

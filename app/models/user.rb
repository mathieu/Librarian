class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

  # Check if user is admin
  public
  def is_admin
    !self.role.nil? && self.role.name == 'admin'
  end

end

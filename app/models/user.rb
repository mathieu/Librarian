class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

  # Assign a default role before creation
  before_create :set_default_role

  # Check if user is admin
  public
  def is_admin
    !self.role.nil? && self.role.name == 'admin'
  end

  # Assign the default 'registered' role to user
  private
  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end

end

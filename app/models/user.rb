class User < ActiveRecord::Base
  extend Gastropod

  include Gastropod::ActiveRecord::Validations

  VOLUNTEER = 'Volunteer'
  LEADER    = 'Leader'
  ROLES     = [VOLUNTEER, LEADER]

  devise :database_authenticatable, 
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :name, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: ROLES }

  slug :name

  ROLES.each do |role|
    scope role.downcase, -> { where(role: role) }

    define_method "#{role.downcase}?" do
      self.role == role
    end
  end

  def to_s
    name
  end

  def to_param
    slug
  end
end

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

  has_many :members, dependent: :destroy
  has_many :groups, through: :members

  validates :name, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: ROLES }
  validates :active, inclusion: { in: [true, false] }

  scope :active,   -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  slug :name

  ROLES.each do |role|
    scope role.downcase, -> { active.where(role: role) }

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

  def activate
    update_attributes(active: true)
  end

  def deactivate
    update_attributes(active: false)
  end

  def inactive?
    !active?
  end
end

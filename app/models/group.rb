class Group < ActiveRecord::Base
  extend Gastropod

  include Gastropod::ActiveRecord::Validations

  slug :name

  acts_as_list

  has_many :members, dependent: :destroy
  has_many :users, through: :members

  scope :by_position, -> { order(:position) }

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end

  def to_param
    slug
  end
end

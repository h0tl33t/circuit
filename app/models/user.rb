class User < ActiveRecord::Base
  extend Gastropod

  include Gastropod::ActiveRecord::Validations

  devise :database_authenticatable, 
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :name, presence: true, uniqueness: true

  slug :name

  def to_s
    name
  end

  def to_param
    slug
  end
end

class Ailment < ActiveRecord::Base
  # an Ailment can be treated by different Specialties
  has_and_belongs_to_many :specialties
  has_many :doctors, through: :specialties

  validates :name, presence: true, uniqueness: true
end

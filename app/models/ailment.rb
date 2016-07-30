class Ailment < ActiveRecord::Base
  has_and_belongs_to_many :specialties
  has_many :doctors, through: :specialties

  validates :name, presence: true, uniqueness: true
end

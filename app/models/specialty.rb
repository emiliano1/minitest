class Specialty < ActiveRecord::Base
  # an Specialty is appropriate for different Ailments
  has_and_belongs_to_many :ailments
  has_many :doctors, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end

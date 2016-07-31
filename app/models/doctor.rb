class Doctor < ActiveRecord::Base
  include PersonConcern

  # returns all appropriate Doctors for the given Ailment, based on Doctor's Specialty
  scope :appropriate_for, ->(ailment_id) { joins(specialty: :ailments).where('ailments.id' => ailment_id) }

  belongs_to :specialty
  has_many :appointments

  delegate :name, to: :specialty, prefix: true, allow_nil: true

  def name
    "Dr. #{super}"
  end

  # return Doctor's name and Specialty's name
  # eg: Dr. John Doe (Orthopedist)
  def name_with_specialty
    return name if specialty.nil?

    "#{name} (#{specialty_name})"
  end

  # checks if the Doctor is appropriate for the given Ailment
  def is_appropriate_for?(ailment)
    ailment.doctors.include?(self)
  end
end

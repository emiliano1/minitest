class Doctor < ActiveRecord::Base
  include PersonConcern

  scope :appropriate_for, ->(ailment_id) { joins(specialty: :ailments).where('ailments.id' => ailment_id) }

  belongs_to :specialty
  has_many :appointments

  delegate :name, to: :specialty, prefix: true, allow_nil: true

  def name
    "Dr. #{super}"
  end

  def name_with_specialty
    return name if specialty.nil?

    "#{name} (#{specialty_name})"
  end

  def address
    "#{street} #{zip}, #{city}, #{state}"
  end

  def is_appropriate_for?(ailment)
    ailment.doctors.include?(self)
  end
end

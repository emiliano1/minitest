class Doctor < ActiveRecord::Base
  include PersonConcern

  def name
    "Dr. #{super}"
  end
end

class Patient < ActiveRecord::Base
  include PersonConcern

  has_many :appointments
end

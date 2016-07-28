module StatesHelper
  def us_state_options
    PersonConcern::US_STATES.invert
  end
end

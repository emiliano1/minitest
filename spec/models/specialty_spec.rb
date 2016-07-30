require 'rails_helper'

describe Specialty do
  subject { create :specialty }

  it { is_expected.to be_valid }
end

require 'rails_helper'

describe Patient do
  subject { create :patient }

  it { is_expected.to be_valid }

  it_behaves_like 'a person'
end

require 'rails_helper'
require 'support/person_examples'

describe Patient do
  subject { create :patient }

  it { is_expected.to be_valid }

  it_behaves_like 'a person'

  describe 'associations' do
    it { should have_many(:appointments) }
  end
end

require 'rails_helper'

describe Ailment do
  subject { create :ailment }

  it { is_expected.to be_valid }

  describe 'associations' do
    it { should have_and_belong_to_many :specialties }
    it { should have_many :doctors }
  end
end

require 'rails_helper'
require 'support/person_examples'

describe Doctor do
  subject { create :doctor }

  it { is_expected.to be_valid }

  it_behaves_like 'a person'

  describe '#name' do
    let(:name) { subject.name }

    it 'starts with "Dr. "' do
      expect(name.starts_with?('Dr. ')).to be_truthy
    end
  end
end

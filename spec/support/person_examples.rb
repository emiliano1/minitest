require 'rails_helper'

shared_examples_for 'a person' do
  %i(email first_name last_name street city state zip).each do |field|
    it { is_expected.to validate_presence_of field }
  end

  specify do
    expect(subject)
      .to validate_inclusion_of(:state).in_array(PersonConcern::VALID_STATES)
  end

  describe '#email' do
    context 'when valid' do
      before { subject.email = 'jondoe@person.com' }

      it { is_expected.to be_valid }
    end

    context 'when not valid' do
      before { subject.email = 'invalid_email' }

      it { is_expected.to_not be_valid }
    end
  end

  describe '#zip' do
    context 'when valid' do
      before { subject.zip = '90210' }

      it { is_expected.to be_valid }
    end

    context 'when not valid' do
      before { subject.zip = 'invalid zip' }

      it { is_expected.to_not be_valid }
    end
  end

  describe '#name' do
    let(:first_name) { subject.first_name }
    let(:last_name) { subject.last_name }
    let(:name) { subject.name }

    it 'includes #first_name' do
      expect(name.include?(first_name)).to be_truthy
    end

    it 'includes #last_name' do
      expect(name.include?(last_name)).to be_truthy
    end
  end
end

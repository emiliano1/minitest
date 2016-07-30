require 'rails_helper'
require 'support/person_examples'

describe Doctor do
  subject { create :doctor }

  it { is_expected.to be_valid }

  it_behaves_like 'a person'

  describe 'associations' do
    it { should belong_to(:specialty) }
    it { should have_many(:appointments) }
  end

  describe '.appropriate_for' do
    before do
      @specialty = create(:specialty, name: 'Orthopedist')
      @non_appropriate_specialty = create(:specialty, name: 'Opthamologist')

      @ailment = create(:ailment, specialties: [@specialty])
    end

    it 'returns doctors appropriate for the ailment' do
      appropriate_doctor1 = create(:doctor, specialty: @specialty)
      appropriate_doctor2 = create(:doctor, specialty: @specialty)
      non_appropriate_doctor = create(:doctor, specialty: @non_appropriate_specialty)

      expect(Doctor.appropriate_for(@ailment.id)).to eq([appropriate_doctor1, appropriate_doctor2])
    end
  end

  describe '#name' do
    let(:name) { subject.name }

    it 'starts with "Dr. "' do
      expect(name.starts_with?('Dr. ')).to be_truthy
    end
  end

  describe '#name_with_specialty' do
    context 'when specialty is present' do
      before do
        subject.specialty = create(:specialty, name: 'Cardiologist')
      end

      it "includes the specialty's name between parenthesis" do
        expect(subject.name_with_specialty =~ /\(Cardiologist\)/).to be_truthy
      end
    end

    context 'when specialty is not present' do
      before do
        subject.specialty = nil
      end

      it "doesn't include specialty's name" do
        expect(subject.name_with_specialty).to eq(subject.name)
      end
    end
  end

  describe '#is_appropriate_for?' do
    before do
      @specialty = create(:specialty, name: 'Orthopedist')
      @non_appropriate_specialty = create(:specialty, name: 'Opthamologist')

      @ailment = create(:ailment, specialties: [@specialty])
    end

    it "returns true if the doctor is appropriate for the ailment" do
      doctor = create(:doctor, specialty: @specialty)

      expect(doctor.is_appropriate_for?(@ailment)).to be_truthy
    end

    it "returns false if the doctor is not appropriate for the ailment" do
      doctor = create(:doctor, specialty: @non_appropriate_specialty)

      expect(doctor.is_appropriate_for?(@ailment)).to be_falsey
    end
  end
end

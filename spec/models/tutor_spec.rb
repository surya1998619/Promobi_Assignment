require 'rails_helper'

RSpec.describe Tutor, type: :model do
  subject { FactoryBot.build(:tutor) }

  describe "validations" do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:course) }
  end
end

require 'rails_helper'

RSpec.describe Course, type: :model do
  subject { FactoryBot.build(:course) }

  describe "validations" do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid when length of name is less than 3' do
      subject.name = "ab"
      expect(subject).to_not be_valid
    end
  end

  describe "associations" do
    it { should have_many(:tutors) }
  end
end

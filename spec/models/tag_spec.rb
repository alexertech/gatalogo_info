require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:gatos) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:tag)).to be_valid
    end
  end
end
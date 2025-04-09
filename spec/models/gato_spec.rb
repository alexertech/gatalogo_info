require 'rails_helper'

RSpec.describe Gato, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:tags) }
    it { should have_one_attached(:image) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:breed) }
    it { should validate_presence_of(:description) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:gato)).to be_valid
    end
  end

  describe 'creating a gato' do
    context 'with valid attributes' do
      it 'should save successfully' do
        gato = build(:gato)
        expect(gato.save).to be true
      end
    end

    context 'with invalid attributes' do
      it 'should not save when missing name' do
        gato = build(:gato, name: nil)
        expect(gato.save).to be false
        expect(gato.errors[:name]).to include("can't be blank")
      end

      it 'should not save when missing breed' do
        gato = build(:gato, breed: nil)
        expect(gato.save).to be false
        expect(gato.errors[:breed]).to include("can't be blank")
      end

      it 'should not save when missing description' do
        gato = build(:gato, description: nil)
        expect(gato.save).to be false
        expect(gato.errors[:description]).to include("can't be blank")
      end
    end
  end
end
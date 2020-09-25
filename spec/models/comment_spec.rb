require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { build(:comment, valid_attributes)}
  let(:valid_attributes) { attributes_for(:comment) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a body' do
      subject.body = nil
      expect(subject).to_not be_valid
    end
  end
end

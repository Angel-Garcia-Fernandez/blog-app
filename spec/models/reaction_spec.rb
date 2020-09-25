require 'rails_helper'

RSpec.describe Reaction, type: :model do
  subject { build(:reaction, valid_attributes) }
  let(:user) { create :user }
  let(:comment) { create :comment}
  let(:reaction) { :like }
  let(:valid_attributes) { { reaction_type: reaction, author: user, comment: comment } }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a type' do
      subject.reaction_type = nil
      expect(subject).to_not be_valid
    end

    context 'about uniqueness' do
      let(:other_user) { create :user }
      let(:other_comment) { create :comment }
      let(:other_reaction) { :smile }
      let!(:already_created_reaction) { create :reaction, reaction_type: reaction, author: user, comment: comment }

      it 'is not valid when repeated reaction in same comment for the same user' do
        expect(subject).to_not be_valid
      end

      it 'is valid when not repeated reaction' do
        subject.reaction_type = other_reaction
        expect(subject).to be_valid
      end

      it 'is valid when not repeated author' do
        subject.author = other_user
        expect(subject).to be_valid
      end

      it 'is valid when not repeated comment' do
        subject.comment = other_comment
        expect(subject).to be_valid
      end
    end

  end
end

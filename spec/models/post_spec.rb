require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { post }

  let(:post) { build(:post, valid_attributes)}
  let(:valid_attributes) { attributes_for(:post) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a body' do
      subject.body = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an author' do
      subject.author = nil
      expect(subject).to_not be_valid
    end
  end
  
  describe '#publish' do
    let(:publishing_time) { 1.day.ago }

    before(:each) do
      travel_to publishing_time
      post.publish
      travel_back
    end

    it 'sets published_at current time' do
      expect(post.published_at).to be_within(1.second).of publishing_time
    end
  end

  describe '#publised?' do
    subject { post.published? }

    context 'post has a published time' do
      let(:post) { build(:post, :published)}

      it 'returns true' do
        expect(subject).to eq true
      end
    end

    context 'post doesn\'t have a published time' do
      let(:post) { create(:post, published_at: nil)}

      it 'returns false' do
        expect(subject).to eq false
      end
    end
  end
end

require 'rails_helper'

RSpec.describe '/reactions', type: :request do
  let(:blog_post) { create(:post) }
  let(:comment) { create(:comment, post: blog_post) }
  let(:user) { create(:user) }

  let(:valid_attributes) { { reaction_type: :like } }

  let(:invalid_attributes) { { reaction_type: nil } }

  before(:each) do
    sign_in user
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Reaction' do
        expect {
          post comment_reactions_url(comment), params: { reaction: valid_attributes }
        }.to change(Reaction, :count).by(1)
      end

      it 'redirects to the created reaction' do
        post comment_reactions_url(comment), params: { reaction: valid_attributes }
        expect(response).to redirect_to(post_url(blog_post))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Reaction' do
        expect {
          post comment_reactions_url(comment), params: { reaction: invalid_attributes }
        }.to change(Reaction, :count).by(0)
      end

      it 'redirects to the post comment list' do
        post comment_reactions_url(comment), params: { reaction: invalid_attributes }
        expect(response).to redirect_to(post_url(blog_post))
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:reaction) { create(:reaction, comment: comment, author: user)}
    it 'destroys the requested reaction' do
      expect {
        delete comment_reaction_url(comment, reaction)
      }.to change(Reaction, :count).by(-1)
    end

    it 'redirects to the post comment list' do
      delete comment_reaction_url(comment, reaction)
      expect(response).to redirect_to(post_url(blog_post))
    end
  end
end

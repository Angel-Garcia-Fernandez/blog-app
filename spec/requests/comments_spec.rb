require 'rails_helper'

RSpec.describe '/comments', type: :request do
  let(:blog_post) { create(:post) }
  let(:user) { create(:user) }

  let(:valid_attributes) { { body: 'Comment body' } }

  let(:invalid_attributes) { { body: nil } }

  before(:each) do
    sign_in user
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_post_comment_url(blog_post)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let!(:comment) { create :comment, author: user, post: blog_post }
    it 'render a successful response' do
      get edit_post_comment_url(blog_post, comment)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Comment' do
        expect {
          post post_comments_url(blog_post), params: { comment: valid_attributes }
        }.to change(Comment, :count).by(1)
      end

      it 'redirects to the post' do
        post post_comments_url(blog_post), params: { comment: valid_attributes }
        expect(response).to redirect_to(post_url(blog_post))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Comment' do
        expect {
          post post_comments_url(blog_post), params: { comment: invalid_attributes }
        }.to change(Comment, :count).by(0)
      end

      it 'redirects to the post' do
        post post_comments_url(blog_post), params: { comment: invalid_attributes }
        expect(response).to redirect_to(post_url(blog_post))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { body: 'New comment body' } }
      let!(:comment) { create :comment, author: user, post: blog_post }

      it 'updates the requested comment' do
        patch post_comment_url(blog_post, comment), params: { comment: new_attributes }
        comment.reload
        expect(comment.body).to eq 'New comment body'
      end

      it 'redirects to the comment' do
        patch post_comment_url(blog_post, comment), params: { comment: new_attributes }
        comment.reload
        expect(response).to redirect_to(post_url(blog_post))
      end
    end

    context 'with invalid parameters' do
      let!(:comment) { create :comment, author: user, post: blog_post }

      it 'renders a successful response (i.e. to display the \'edit\' template)' do
        patch post_comment_url(blog_post, comment), params: { comment: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:comment) { create :comment, author: user, post: blog_post }

    it 'destroys the requested comment' do
      expect {
        delete post_comment_url(blog_post, comment)
      }.to change(Comment, :count).by(-1)
    end

    it 'redirects to the comments list' do
      delete post_comment_url(blog_post,comment)
      expect(response).to redirect_to(post_url(blog_post))
    end
  end
end

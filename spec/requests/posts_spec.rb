require 'rails_helper'


RSpec.describe '/posts', type: :request do
  let(:user) { create(:user) }

  let(:valid_attributes) { attributes_for(:post) }
  let(:invalid_attributes) { attributes_for(:post, title: nil) }

  before(:each) do
    sign_in user
  end

  describe 'GET /index' do
    let!(:blog_post) { create(:post, author: user)}
    it 'renders a successful response' do
      get posts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let!(:blog_post) { create(:post, author: user)}
    it 'renders a successful response' do
      get post_url(blog_post)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_post_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let!(:blog_post) { create(:post, author: user)}
    it 'render a successful response' do
      get edit_post_url(blog_post)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Post' do
        expect {
          post posts_url, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it 'redirects to your posts list' do
        post posts_url, params: { post: valid_attributes }
        expect(response).to redirect_to(my_posts_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Post' do
        expect {
          post posts_url, params: { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end

      it 'renders a successful response (i.e. to display the \'new\' template)' do
        post posts_url, params: { post: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for(:post, title: 'Other title') }
      let!(:blog_post) { create(:post, author: user)}

      it 'updates the requested post' do
        patch post_url(blog_post), params: { post: new_attributes }
        blog_post.reload
        expect(blog_post.title).to eq 'Other title'
      end

      it 'redirects to the post' do
        patch post_url(blog_post), params: { post: new_attributes }
        blog_post.reload
        expect(response).to redirect_to(post_url(blog_post))
      end
    end

    context 'with invalid parameters' do
      let!(:blog_post) { create(:post, author: user)}
      it 'renders a successful response (i.e. to display the \'edit\' template)' do
        patch post_url(blog_post), params: { post: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:blog_post) { create(:post, author: user)}
    it 'destroys the requested post' do
      expect {
        delete post_url(blog_post)
      }.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      delete post_url(blog_post)
      expect(response).to redirect_to(posts_url)
    end
  end
end

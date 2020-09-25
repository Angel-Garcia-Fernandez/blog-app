require 'rails_helper'

RSpec.describe '/publishes', type: :request do
  describe 'POST /create' do
    let!(:blog_post) { create(:post, published_at: nil) }

    before(:each) do
      sign_in create(:user)
    end

    it 'creates a new Publish Post' do
      expect {
        post post_publishes_url(blog_post)
      }.to change(Post.published, :count).by(1)
    end

    it 'redirects to user posts' do
      post post_publishes_url(blog_post)
      expect(response).to redirect_to(my_posts_url)
    end
  end
end

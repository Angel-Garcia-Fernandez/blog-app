require 'rails_helper'

RSpec.describe '/publishes', type: :request do
  describe 'POST /create' do
    let!(:post) { create(:post, published_at: nil) }

    it 'creates a new Publish Post' do
      expect {
        post post_publishes_url(post)
      }.to change(Post.published, :count).by(1)
    end

    it 'redirects to user posts' do
      post post_publishes_url(post)
      expect(response).to redirect_to(my_posts_url)
    end
  end
end

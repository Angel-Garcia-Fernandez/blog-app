require 'rails_helper'

RSpec.describe CommentsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/posts/13/comments/new').to route_to('comments#new', post_id: '13')
    end

    it 'routes to #edit' do
      expect(get: '/posts/13/comments/1/edit').to route_to('comments#edit', post_id: '13', id: '1')
    end


    it 'routes to #create' do
      expect(post: '/posts/13/comments').to route_to('comments#create', post_id: '13')
    end

    it 'routes to #update via PUT' do
      expect(put: '/posts/13/comments/1').to route_to('comments#update', post_id: '13', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/posts/13/comments/1').to route_to('comments#update', post_id: '13', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/posts/13/comments/1').to route_to('comments#destroy', post_id: '13', id: '1')
    end
  end
end

require 'rails_helper'

RSpec.describe MyPostsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/my_posts').to route_to('my_posts#index')
    end
  end
end

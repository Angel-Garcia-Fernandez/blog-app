require 'rails_helper'

RSpec.describe PublishesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/posts/13/publishes').to route_to('publishes#create', post_id: '13')
    end
  end
end

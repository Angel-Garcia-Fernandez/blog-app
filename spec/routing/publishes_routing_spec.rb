require 'rails_helper'

RSpec.describe PublishesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/publishes').to route_to('publishes#create')
    end
  end
end

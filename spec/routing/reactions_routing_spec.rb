require 'rails_helper'

RSpec.describe ReactionsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: 'comments/1/reactions').to route_to('reactions#create', comment_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'comments/1/reactions/2').to route_to('reactions#destroy', comment_id: '1', id: '2')
    end
  end
end

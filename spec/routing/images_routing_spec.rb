require 'rails_helper'

RSpec.describe ImagesController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/images/new').to route_to('images#new')
    end

    it 'routes to #create' do
      expect(post: '/images/').to route_to('images#create')
    end
  end
end

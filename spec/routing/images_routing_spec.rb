require 'rails_helper'

RSpec.describe ImageController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/image/new').to route_to('image#new')
    end

    it 'routes to #create' do
      expect(post: '/image/create_image').to route_to('image#create_image')
    end
  end
end

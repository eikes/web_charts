require 'rails_helper'

RSpec.describe ImageController, type: :controller do
  let(:valid_params) do
    { 'image_params' => {
      'data' => '9',
      'type' => 'svg',
      'item_width' => '50',
      'item_height' => '70',
      'width' => '1000',
      'style' => 'circle',
      'columns' => '20'
    } }.with_indifferent_access
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  describe 'POST #create_image' do
    it 'returns http success' do
      post :create_image, valid_params
      expect(response).to have_http_status(:success)
    end
    it 'contains svg' do
      post :create_image, valid_params
      expect(response.body).to match(/svg/)
    end
  end
end

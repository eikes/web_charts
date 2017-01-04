require 'rails_helper'

RSpec.describe ImageController, type: :controller do
  let(:valid_params) do 
    {"image_params" => {"type"=>"svg", "icon_type"=>"circle", "data"=>"9"}}
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  describe "POST #create_image" do
    it "returns http success" do
      post :create_image, valid_params 
      expect(response).to have_http_status(:success)
    end
  end

end

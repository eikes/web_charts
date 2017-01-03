require 'rails_helper'

RSpec.describe ImageController, type: :controller do

  describe "GET #create_image" do
    it "returns http success" do
      get :create_image
      expect(response).to have_http_status(:success)
    end
  end

end

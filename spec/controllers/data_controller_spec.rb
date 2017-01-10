require 'rails_helper'

RSpec.describe DataController, type: :controller do

  describe "GET #create_datum" do
    it "returns http success" do
      get :create_datum
      expect(response).to have_http_status(:success)
    end
  end

end

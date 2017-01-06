require 'rails_helper'

RSpec.describe ChartsController, type: :controller do

  let!(:chart) { Fabricate(:chart) }

  let(:valid_attributes) { Fabricate.attributes_for(:chart) }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }


  describe "GET #show" do
    it "assigns the requested chart as @chart" do
      get :show, { id: chart.to_param }, valid_session
      expect(assigns(:chart)).to eq(chart)
    end
  end

  describe "GET #new" do
    it "assigns a new chart as @chart" do
      get :new, {}, valid_session
      expect(assigns(:chart)).to be_a_new(Chart)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Chart" do
        expect {
          post :create, {chart: valid_attributes }, valid_session
        }.to change(Chart, :count).by(1)
      end

      it "assigns a newly created chart as @chart" do
        post :create, {chart: valid_attributes }, valid_session
        expect(assigns(:chart)).to be_a(Chart)
        expect(assigns(:chart)).to be_persisted
      end

      # it "redirects to the created chart" do
      #   post :create, {chart: valid_attributes }, valid_session
      #   expect(response).to redirect_to(Chart.last)
      # end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved chart as @chart" do
        post :create, {chart: invalid_attributes }, valid_session
        expect(assigns(:chart)).to be_a_new(Chart)
      end

      it "re-renders the 'new' template" do
        post :create, {chart: invalid_attributes }, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested chart" do
  #       put :update, { id: chart.to_param, chart: new_attributes }, valid_session
  #       chart.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested chart as @chart" do
  #       put :update, { id: chart.to_param, chart: valid_attributes }, valid_session
  #       expect(assigns(:chart)).to eq(chart)
  #     end

  #     it "redirects to the chart" do
  #       put :update, { id: chart.to_param, chart: valid_attributes }, valid_session
  #       expect(response).to redirect_to(chart)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the chart as @chart" do
  #       put :update, { id: chart.to_param, chart: invalid_attributes }, valid_session
  #       expect(assigns(:chart)).to eq(chart)
  #     end

  #     it "re-renders the 'edit' template" do
  #       put :update, { id: chart.to_param, chart: invalid_attributes }, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested chart" do
  #     expect {
  #       delete :destroy, { id: chart.to_param }, valid_session
  #     }.to change(Chart, :count).by(-1)
  #   end

  #   it "redirects to the charts list" do
  #     delete :destroy, { id: chart.to_param }, valid_session
  #     expect(response).to redirect_to(charts_url)
  #   end
  # end

end

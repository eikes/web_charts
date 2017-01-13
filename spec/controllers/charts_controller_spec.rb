require 'rails_helper'

RSpec.describe ChartsController, type: :controller do
  let!(:chart) { Fabricate(:chart) }
  let(:valid_attributes) { Fabricate.attributes_for(:chart) }

  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }

  describe 'GET #show' do
    it 'assigns the requested chart as @chart' do
      get :show, id: chart.to_param
      expect(assigns(:chart)).to eq(chart)
    end
    context 'svg' do
      it 'returns svg' do
        get :show, id: chart.to_param
        expect(response.body).to match(/svg/)
      end
    end
    context 'png' do
      before do
        chart.update(file_type: 'png')
      end
      it 'returns successfull status code when png-image is required' do
        get :show, id: chart.to_param
        expect(response).to be_success
      end
    end
  end

  describe 'GET #new' do
    it 'assigns a new chart as @chart' do
      get :new, {}
      expect(assigns(:chart)).to be_a_new(Chart)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested post as @post' do
      get :edit, id: chart.to_param
      expect(assigns(:chart)).to eq(chart)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Chart' do
        expect {
          post :create, chart: valid_attributes
        }.to change(Chart, :count).by(1)
      end

      it 'assigns a newly created chart as @chart' do
        post :create, chart: valid_attributes
        expect(assigns(:chart)).to be_a(Chart)
        expect(assigns(:chart)).to be_persisted
      end

      it 'redirects to the created chart' do
        post :create, chart: valid_attributes
        expect(response).to redirect_to(Chart.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved chart as @chart' do
        post :create, chart: invalid_attributes
        expect(assigns(:chart)).to be_a_new(Chart)
      end

      it "re-renders the 'new' template" do
        post :create, chart: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested chart' do
        put :update, id: chart.to_param, chart: { title: 'fabrication_clone' }
        chart.reload
        expect(chart.title).to eq('fabrication_clone')
      end

      # it "assigns the requested chart as @chart" do
      #   put :update, { id: chart.to_param, chart: valid_attributes }
      #   expect(assigns(:chart)).to eq(chart)
      # end

      # it "redirects to the chart" do
      #   put :update, { id: chart.to_param, chart: valid_attributes }
      #   expect(response).to redirect_to(chart)
      # end
    end

    # context "with invalid params" do
    # it "assigns the chart as @chart" do
    #   put :update, { id: chart.to_param, chart: invalid_attributes }
    #   expect(assigns(:chart)).to eq(chart)
    # end

    # it "re-renders the 'edit' template" do
    #   put :update, { id: chart.to_param, chart: invalid_attributes }
    #   expect(response).to render_template("edit")
    # end
    # end
  end

  # describe "DELETE #destroy" do
  #   it "destroys the requested chart" do
  #     expect {
  #       delete :destroy, { id: chart.to_param }
  #     }.to change(Chart, :count).by(-1)
  #   end

  #   it "redirects to the charts list" do
  #     delete :destroy, { id: chart.to_param }
  #     expect(response).to redirect_to(charts_url)
  #   end
  # end
end

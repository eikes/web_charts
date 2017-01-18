require 'rails_helper'

RSpec.describe ChartsController, type: :controller do
  let!(:chart) { Fabricate(:chart) }
  let!(:valid_attributes) do
    Fabricate.attributes_for(:chart, data_attributes: [
      Fabricate.attributes_for(:datum, value: 1, label: 'fire', color: 'red'),
      Fabricate.attributes_for(:datum, value: 2, label: 'see', color: 'blue'),
      Fabricate.attributes_for(:datum, value: 3, label: 'grass', color: 'green'),
      Fabricate.attributes_for(:datum, value: 4, label: 'sand', color: 'yellow')
    ])
  end

  let!(:vanilla_chart) do
    Fabricate(:chart, background_color: nil, style: 'circle', data: [
      Fabricate(:datum, value: 1, label: 'fire' , color: nil),
      Fabricate(:datum, value: 2, label: 'see', color: nil),
      Fabricate(:datum, value: 3, label: 'grass', color: nil),
      Fabricate(:datum, value: 4, label: 'sand', color: nil)
    ])
  end


  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }
  describe "GET #index" do
    it 'renders the index-template' do
      get :index
      expect(response).to be_success
    end
    it "assigns all charts as @charts" do
      Fabricate.times(4, :chart)
      charts = Chart.all
      get :index
      expect(assigns(:charts)).to eq(charts)
    end
  end

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
    context 'default options' do
      it 'assigns the requested chart as @chart' do
        get :show, id: vanilla_chart.to_param
        expect(assigns(:charts_gem_chart).background_color).to eq('#ffffff')
        expect(assigns(:charts_gem_chart).outer_margin).to eq(30)
        expect(assigns(:charts_gem_chart).colors).to eq([
          '#e41a1d',
          '#377eb9',
          '#4daf4b',
          '#984ea4',
          '#ff7f01',
          '#ffff34',
          '#a65629',
          '#f781c0',
          '#888888'
        ])
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
        expect(response).to redirect_to(edit_chart_path(Chart.last))
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

      it "assigns the requested chart as @chart" do
        put :update, { id: chart.to_param, chart: valid_attributes }
        expect(assigns(:chart)).to eq(chart)
      end

      it "redirects to the chart" do
        put :update, { id: chart.to_param, chart: valid_attributes }
        expect(response).to redirect_to(edit_chart_path(chart))
      end
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

  describe "DELETE #destroy" do
    it "destroys the requested chart" do
      expect {
        delete :destroy, { id: chart.to_param }
      }.to change(Chart, :count).by(-1)
    end

    it "redirects to the charts list" do
      delete :destroy, { id: chart.to_param }
      expect(response).to redirect_to(charts_path)
    end
  end
end

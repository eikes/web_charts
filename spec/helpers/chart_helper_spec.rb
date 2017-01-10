require 'rails_helper'

RSpec.describe ImageHelper, type: :helper do
  let(:valid_params) { Fabricate(:chart) }

  describe 'processing_chart_options' do
    it 'takes an chart object as input' do
      pending 'todo, how to test this'
      expect(helper.processing_chart_options(valid_params)).to be_an_instance_of(Chart)
    end
    it 'converts keys of params to symbols' do
      expect(helper.processing_chart_options(valid_params).keys).to eq([
        :title, 
        :background_color, 
        :columns, 
        :height, 
        :width, 
        :item_height, 
        :item_width, 
        :file_type, 
        :style
      ])
    end
    it 'converts numbers packed in strings to integers' do
      expect(helper.processing_chart_options(valid_params).values).not_to include('20', '1000', '1000', '50', '50')
      expect(helper.processing_chart_options(valid_params).values).to include(20, 1000, 1000, 50, 50)
    end

  end

  # describe 'graph_data' do
  # it 'extracts data from params and converts it to integer' do
  #   controller.params = valid_params
  #   expect(helper.graph_data).to eq(9)
  # end
  # end
  # describe 'graph_style' do
  # it 'extracts style from params and converts it to symbol' do
  #   controller.params = valid_params
  #   expect(helper.graph_style).to eq(:circle)
  # end
end

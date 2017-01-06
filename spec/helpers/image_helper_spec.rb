require 'rails_helper'

RSpec.describe ImageHelper, type: :helper do
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

  describe 'graph_options' do
    context 'keys' do
      it 'removes data- & style-attribute' do
        controller.params = valid_params
        expect(helper.graph_options.keys).not_to include(:style, :data)
      end
    end

    it 'converts keys of params to symbols' do
      controller.params = valid_params
      expect(helper.graph_options.keys).to eq([
        :type, 
        :item_width, 
        :item_height, 
        :width,
        :columns
      ])
    end
  end

  context 'values' do
    it 'converts numbers packed in strings to integers' do
      controller.params = valid_params
      expect(helper.graph_options.values).not_to include('50', '70', '1000', '20')
      expect(helper.graph_options.values).to include(50, 70, 1000, 20)
    end

    it 'converts strings to symbols' do
      controller.params = valid_params
      expect(helper.graph_options.values).not_to eq(['svg', 50, 70, 1000, 20])
      expect(helper.graph_options.values).to eq([:svg, 50, 70, 1000, 20])
    end
  end

  describe 'graph_data' do
    it 'extracts data from params and converts it to integer' do
      controller.params = valid_params
      expect(helper.graph_data).to eq(9)
    end
  end
  describe 'graph_style' do
    it 'extracts style from params and converts it to symbol' do
      controller.params = valid_params
      expect(helper.graph_style).to eq(:circle)
    end
  end
end

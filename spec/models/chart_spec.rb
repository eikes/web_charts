require 'rails_helper'

RSpec.describe Chart, type: :model do
  let!(:chart) do
    Fabricate(:chart)
  end
  describe '#gem_params' do
    it 'returns options in right format' do
      expect(chart.gem_params).to include(
        title:            'Chart title',
        background_color: '#ffffff',
        columns:          20,
        height:           1000,
        width:            1000,
        item_height:      50,
        item_width:       50,
        type:             :svg,
        style:            :bar,
        colors:           ['red', 'blue', 'green', 'yellow'],
        labels:           ['fire', 'see', 'grass', 'sand'],
        data:             [[123, 456, 789], [222, 333, 444], [100, 200, nil], [nil, -1, -100]]
      )
    end
    it 'returns first column data in an array when pie-chart is selected' do
      chart.style = :pie
      expect(chart.gem_params).to include(
        style: :pie,
        data:  [123, 222, 100, nil]
      )
    end
  end

  describe 'database defaults' do
    vanilla_chart = Chart.new
    it 'returns new @chart with correct default params' do
      expect(vanilla_chart.background_color).to eq('#ffffff')
      expect(vanilla_chart.style).to eq('bar')
      expect(vanilla_chart.file_type).to eq('svg')
    end
  end

  describe 'file_name' do
    it 'returns the parameterized title' do
      chart.title = 'Some example title'
      expect(chart.file_name).to eq('some_example_title.svg')
    end
    it 'returns the selected file type extension' do
      chart.title = 'Some example title'
      chart.file_type = :png
      expect(chart.file_name).to eq('some_example_title.png')
    end
    it 'returns a generic name if no title is given' do
      chart.title = ''
      expect(chart.file_name).to eq("chart_#{Time.zone.now.strftime('%Y_%m_%d_-_%H_%M')}.svg")
    end
  end

  describe 'validations' do
    it 'creates a new instance of a user given valid attributes' do
      expect(chart).to be_valid
    end

    it 'is invalid without data' do
      chart.data = []
      expect(chart).not_to be_valid
    end
  end
end

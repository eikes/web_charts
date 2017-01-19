require 'rails_helper'

RSpec.describe Chart, type: :model do
  let!(:chart) do
    Fabricate(:chart, data: [
      Fabricate(:datum, value: 1, label: 'fire', color: 'red'),
      Fabricate(:datum, value: 2, label: 'see', color: 'blue'),
      Fabricate(:datum, value: 3, label: 'grass', color: 'green'),
      Fabricate(:datum, value: 4, label: 'sand', color: 'yellow')
    ])
  end
  describe '#gem_params' do
    it 'returns options in right format' do
      expect(chart.gem_params).to eq(
        title:            'fabrication',
        background_color: '#ffffff',
        columns:          20,
        grouplabels:      ['pizza', 'pasta', 'spaghetti'],
        height:           1000,
        width:            1000,
        item_height:      50,
        item_width:       50,
        type:             :svg,
        style:            :circle,
        colors:           ['red', 'blue', 'green', 'yellow'],
        labels:           ['fire', 'see', 'grass', 'sand'],
        data:             [1.0, 2.0, 3.0, 4.0]
      )
    end
    it 'returns data in nested arrays when bar-chart is selected' do
      bar_chart = chart
      bar_chart.style = :bar
      expect(bar_chart.gem_params).to eq(
        title:            'fabrication',
        background_color: '#ffffff',
        columns:          20,
        grouplabels:      ['pizza', 'pasta', 'spaghetti'],
        height:           1000,
        width:            1000,
        item_height:      50,
        item_width:       50,
        type:             :svg,
        style:            :bar,
        colors:           ['red', 'blue', 'green', 'yellow'],
        labels:           ['fire', 'see', 'grass', 'sand'],
        data:             [[1.0], [2.0], [3.0], [4.0]]
      )
    end
  end

  describe '#init_defaults' do
    vanilla_chart = Chart.new
    it 'returns new @chart with correct default params' do
      expect(vanilla_chart.background_color).to eq('#ffffff')
      expect(vanilla_chart.style).to eq('circle')
      expect(vanilla_chart.file_type).to eq('svg')
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

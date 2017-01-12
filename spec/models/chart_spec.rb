require 'rails_helper'

RSpec.describe Chart, type: :model do
  let!(:chart) { Fabricate(:chart) } 

  describe 'charts_gem_params' do
    it 'creates a new instance of a user given valid attributes' do
      expect(chart).to be_valid
    end
    it 'returns options in right format' do
      expect(chart.charts_gem_params).to eq(
        title: 'fabrication',
        background_color: 'white',
        columns: 20,
        grouplabels: ['pizza', 'pasta', 'spaghetti'],
        height: 1000,
        width: 1000,
        item_height: 50,
        item_width: 50,
        type: :svg,
        style: :circle,
        colors: ["red", "red", "red", "red"],
        labels: ["fire", "fire", "fire", "fire"],
        data: [10.0, 10.0, 10.0, 10.0]
      )
    end
  end

end

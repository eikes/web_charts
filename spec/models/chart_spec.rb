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

  describe 'charts_gem_params' do
    it 'creates a new instance of a user given valid attributes' do
      expect(chart).to be_valid
    end
    it 'returns options in right format' do
      expect(chart.gem_params).to eq(
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
        colors: ["red", "blue", "green", "yellow"],
        labels: ["fire", "see", "grass", "sand"],
        data: [1.0, 2.0, 3.0, 4.0]
      )
    end
  end
  describe 'default values' do
    it 'returns default values for non-existing params' do
      pending 'todo'
      raise
    end
  end

  describe 'validations' do
    it 'is invalid without data' do
      chart.data = [] 
      expect(chart).not_to be_valid
    end
  end

end



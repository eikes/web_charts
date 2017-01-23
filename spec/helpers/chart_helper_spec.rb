require 'rails_helper'

RSpec.describe ChartHelper, type: :helper do
  describe '#name_file' do
    context 'with given title' do
      it 'returns filename in correct format' do
        @chart = Fabricate.create(:chart) 
        expect(helper.name_file).to eq({:filename=>"fabrication", :filename_extension=>"svg"})
      end
    end
    context 'without given title' do
      it 'returns filename in correct default-format' do
        @chart = Fabricate.create(:chart, title: '') 
        @time_now = Time.now
        allow(Time).to receive(:now).and_return(@time_now)
        expect(helper.name_file).to eq({:filename=>"web_chart_#{@time_now.strftime('%m/%d/%Y')}", :filename_extension=>"svg"})
      end
    end
  end
end

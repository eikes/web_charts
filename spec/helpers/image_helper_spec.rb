require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ImageHelper. For example:
#
# describe ImageHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ImageHelper, type: :helper do

  let(:valid_params) do 
    {"image_params" => {"type"=>"svg", "icon_type"=>"circle", "data"=>"9"}}.with_indifferent_access
  end
  let(:params_with_values_and_keys_as_strings) do 
    {"image_params" => {"type"=>"svg", "icon_type"=>"circle", "data"=>"9"}}.with_indifferent_access
  end
  describe "graph_options" do
    it "it converts keys and values of params to symbols" do
      controller.params = params_with_values_and_keys_as_strings
      expect(helper.graph_options).to eq({type: :svg, icon_type: :circle})
    end
  end

  describe "graph_data" do
    it "it extracts data from params" do
      controller.params = valid_params
      expect(helper.graph_data).to eq(9)
    end
  end
end

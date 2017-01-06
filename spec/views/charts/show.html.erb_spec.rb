require 'rails_helper'

RSpec.describe "charts/show", type: :view do
  before(:each) do
    @chart = assign(:chart, Fabricate(:chart))
  end

  it "renders attributes in <p>" do
    render
  end
end

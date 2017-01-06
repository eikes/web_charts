require 'rails_helper'

RSpec.describe "charts/new", type: :view do
  before(:each) do
    @chart = assign(:chart, Fabricate.build(:chart))
  end

  it "renders new chart form" do
    render

    assert_select "form[action=?][method=?]", charts_path, "post" do
    end
  end
end

require 'spec_helper'

describe "celebrities/index" do
  before(:each) do
    assign(:celebrities, [
      stub_model(Celebrity,
        :name => "Name"
      ),
      stub_model(Celebrity,
        :name => "Name"
      )
    ])
  end

  it "renders a list of celebrities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

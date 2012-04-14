require 'spec_helper'

describe "celebrities/show" do
  before(:each) do
    @celebrity = assign(:celebrity, stub_model(Celebrity,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end

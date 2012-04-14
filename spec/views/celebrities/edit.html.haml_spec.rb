require 'spec_helper'

describe "celebrities/edit" do
  before(:each) do
    @celebrity = assign(:celebrity, stub_model(Celebrity,
      :name => "MyString"
    ))
  end

  it "renders the edit celebrity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => celebrities_path(@celebrity), :method => "post" do
      assert_select "input#celebrity_name", :name => "celebrity[name]"
    end
  end
end

require 'spec_helper'

describe "celebrities/new" do
  before(:each) do
    assign(:celebrity, stub_model(Celebrity,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new celebrity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => celebrities_path, :method => "post" do
      assert_select "input#celebrity_name", :name => "celebrity[name]"
    end
  end
end

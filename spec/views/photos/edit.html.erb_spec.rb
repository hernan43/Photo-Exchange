require 'spec_helper'

describe "photos/edit.html.erb" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :new_record? => false,
      :user_id => 1,
      :name => "MyString",
      :description => "MyText",
      :calculated_rating => 1,
      :is_visible => false
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => photo_path(@photo), :method => "post" do
      assert_select "input#photo_user_id", :name => "photo[user_id]"
      assert_select "input#photo_name", :name => "photo[name]"
      assert_select "textarea#photo_description", :name => "photo[description]"
      assert_select "input#photo_calculated_rating", :name => "photo[calculated_rating]"
      assert_select "input#photo_is_visible", :name => "photo[is_visible]"
    end
  end
end

require 'rails_helper'

RSpec.describe "tags/new", type: :view do
  before(:each) do
    assign(:tag, Tag.new(
      name: "MyString",
      color: "MyString",
      favorite: false,
      user: nil
    ))
  end

  it "renders new tag form" do
    render

    assert_select "form[action=?][method=?]", tags_path, "post" do

      assert_select "input[name=?]", "tag[name]"

      assert_select "input[name=?]", "tag[color]"

      assert_select "input[name=?]", "tag[favorite]"

      assert_select "input[name=?]", "tag[user_id]"
    end
  end
end

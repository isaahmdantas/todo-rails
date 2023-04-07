require 'rails_helper'

RSpec.describe "socials/new", type: :view do
  before(:each) do
    assign(:social, Social.new(
      name: "MyString",
      url: "MyString",
      icon: "MyString",
      user: nil
    ))
  end

  it "renders new social form" do
    render

    assert_select "form[action=?][method=?]", socials_path, "post" do

      assert_select "input[name=?]", "social[name]"

      assert_select "input[name=?]", "social[url]"

      assert_select "input[name=?]", "social[icon]"

      assert_select "input[name=?]", "social[user_id]"
    end
  end
end

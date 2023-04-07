require 'rails_helper'

RSpec.describe "socials/edit", type: :view do
  let(:social) {
    Social.create!(
      name: "MyString",
      url: "MyString",
      icon: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:social, social)
  end

  it "renders the edit social form" do
    render

    assert_select "form[action=?][method=?]", social_path(social), "post" do

      assert_select "input[name=?]", "social[name]"

      assert_select "input[name=?]", "social[url]"

      assert_select "input[name=?]", "social[icon]"

      assert_select "input[name=?]", "social[user_id]"
    end
  end
end

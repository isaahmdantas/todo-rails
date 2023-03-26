require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      name: "MyString",
      color: "MyString",
      favorite: false,
      view: "MyString",
      user: nil
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input[name=?]", "project[name]"

      assert_select "input[name=?]", "project[color]"

      assert_select "input[name=?]", "project[favorite]"

      assert_select "input[name=?]", "project[view]"

      assert_select "input[name=?]", "project[user_id]"
    end
  end
end

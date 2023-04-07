require 'rails_helper'

RSpec.describe "socials/index", type: :view do
  before(:each) do
    assign(:socials, [
      Social.create!(
        name: "Name",
        url: "Url",
        icon: "Icon",
        user: nil
      ),
      Social.create!(
        name: "Name",
        url: "Url",
        icon: "Icon",
        user: nil
      )
    ])
  end

  it "renders a list of socials" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Icon".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end

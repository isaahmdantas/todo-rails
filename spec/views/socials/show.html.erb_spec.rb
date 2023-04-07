require 'rails_helper'

RSpec.describe "socials/show", type: :view do
  before(:each) do
    assign(:social, Social.create!(
      name: "Name",
      url: "Url",
      icon: "Icon",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Icon/)
    expect(rendered).to match(//)
  end
end

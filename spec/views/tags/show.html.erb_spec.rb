require 'rails_helper'

RSpec.describe "tags/show", type: :view do
  before(:each) do
    assign(:tag, Tag.create!(
      name: "Name",
      color: "Color",
      favorite: false,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end

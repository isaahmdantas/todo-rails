FactoryBot.define do
  factory :project do
    name { "MyString" }
    color { "MyString" }
    favorite { false }
    view { "MyString" }
    user { nil }
  end
end

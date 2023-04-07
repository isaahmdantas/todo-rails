FactoryBot.define do
  factory :tag do
    name { "MyString" }
    color { "MyString" }
    favorite { false }
    user { nil }
  end
end

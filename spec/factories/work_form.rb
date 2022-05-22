FactoryBot.define do
  factory :work_form do
    title         { Faker::Lorem.characters(number: 10) }
    caption       { Faker::Lorem.sentence }
    category_id   { rand(2..8) }
    tool_id       { rand(2..16) }

  end
end
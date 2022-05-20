FactoryBot.define do
  factory :work do
    title         { Faker::Lorem.word(max_length: 40) }
    caption       { Faker::Lorem.sentence }
    category_id   { rand(2..8) }
    tool_id       { rand(2..16) }

  end
end
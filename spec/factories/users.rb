FactoryBot.define do
  factory :user do
    name                  { Faker::Internet.username(specifier: 2..10) }
    profile               { Faker::Lorem.sentence }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end
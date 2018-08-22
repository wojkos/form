FactoryBot.define do
  factory :address do
    city { Faker::Address.city }
    street_name { Faker::Address.street_name }
    street_name_number { Faker::Number.number(2) }
    user_id nil
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :arcade_game do
    name { Faker::Lorem.word }
    manufacturer { Faker::Lorem.word }
    notes { Faker::Lorem.sentence }
    year { (Date.today - (5 + rand(20)).years).year }
    is_active { true }
  end
end

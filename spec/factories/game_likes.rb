# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game_like do
    game  { create(:arcade_game) }
    clicker_ip { Faker::PhoneNumber.phone_number }
  end
end

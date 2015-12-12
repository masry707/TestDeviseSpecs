# require 'support/factory_girl_methods'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email(name) }
    password { Faker::Internet.password(8) }

    trait :confirmed_user do
      confirmed_at DateTime.now
    end

    trait :unconfirmed_user do
      confirmed_at nil
    end
  end
end
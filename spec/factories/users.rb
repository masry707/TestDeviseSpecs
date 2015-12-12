FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end
end

FactoryGirl.define do
  sequence :name do |n|
    "User#{n}"
  end
end

FactoryGirl.define do
  factory :user do
    name
    email
    password 'password'

    trait :confirmed_user do
      confirmed_at DateTime.now
    end

    trait :unconfirmed_user do
      confirmed_at nil
    end
  end
end
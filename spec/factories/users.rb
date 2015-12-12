FactoryGirl.define do
  factory :user do
    name 'User'
    email 'user@example.com'
    password 'password'

    trait :confirmed_user do
      confirmed_at DateTime.now
    end

    trait :unconfirmed_user do
      confirmed_at nil
    end
  end
end
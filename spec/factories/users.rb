FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    confirmed_at { Time.now }
  end

  factory :user_as_guest, class: User do
    guest true
  end
end

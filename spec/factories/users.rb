FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    association :family, factory: :family, strategy: :build
    username Faker::Internet.user_name
    add_attribute(:alias) { username }
    birthdate Faker::Date.between(50.years.ago, 10.years.ago)
    password Faker::Internet.password(8)
  end
end

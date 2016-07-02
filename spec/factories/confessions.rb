FactoryGirl.define do
  factory :confession do
    association :user, factory: :user, strategy: :build
    body Faker::Lorem.sentence
  end
end

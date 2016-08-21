FactoryGirl.define do
  factory :user do
    sequence(:name)  { |i| "Phil the #{i}#{i.ordinal}" }
    sequence(:email) { |i| "phil#{i}@test.com" }
    password 'password'
  end
end

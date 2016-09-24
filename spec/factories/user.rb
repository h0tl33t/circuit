FactoryGirl.define do
  factory :user do
    sequence(:name)  { |i| "Phil the #{i}#{i.ordinal}" }
    sequence(:email) { |i| "phil#{i}@test.com" }
    password 'password'

    User::ROLES.each do |user_role|
      trait user_role.downcase.to_sym do
        role user_role
      end
    end

    trait :inactive do
      active false
    end
  end
end

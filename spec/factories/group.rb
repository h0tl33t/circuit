FactoryGirl.define do
  factory :group do
    sequence(:name) { |i| "Week #{i}" }
  end
end

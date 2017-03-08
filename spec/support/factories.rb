FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'John'
    last_name 'Smith'
    password "password"
    password_confirmation "password"
  end

  factory :theater do
  name 'Cinema'
  address '123 Street'
  city 'Philadelphia'
  state 'PA'
  zip '19123'
  end
end

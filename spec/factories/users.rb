# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email { |n| "email#{n}@example.com" }
  	password "123456789"
  	password_confirmation "123456789"
  end
end

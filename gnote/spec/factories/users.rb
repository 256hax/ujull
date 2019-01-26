FactoryBot.define do
  factory :user do
    id {1}
    email {Faker::Internet.email}
    password {"password"}
    password_confirmation {"password"}
    confirmed_at Date.today
  end
end
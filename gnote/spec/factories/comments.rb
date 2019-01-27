FactoryBot.define do
  factory :comment do
    id { 1 }
    body { Faker::Lorem.sentence }
    message_id { 1 }
    user_id { 1 }
  end
end

FactoryBot.define do
  factory :message do
    id { 1 }
    body { Faker::Lorem.sentence }
    user_id { 1 }
    likes_count { 0 }
  end
end

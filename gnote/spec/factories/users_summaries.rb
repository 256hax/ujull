FactoryBot.define do
  factory :users_summary, class: 'Users::Summary' do
    id { 1 }
    user_id { 1 }
    messages_count { 0 }
    comments_count { 0 }
    likes_count { 0 }
  end
end

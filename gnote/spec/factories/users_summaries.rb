FactoryBot.define do
  factory :users_summary, class: 'Users::Summary' do
    user { nil }
    messages_count { 1 }
    comments_count { 1 }
    likes_count { 1 }
  end
end

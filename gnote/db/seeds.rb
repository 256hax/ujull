# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(
  email: 'dev@example.com',
  password: 'password',
  confirmed_at: Date.today,
  created_at: Date.today,
  updated_at: Date.today
)

Message.create!([
  {
    id: 1,
    body: '今日も朝から掃除、洗濯、洗い物をすましてから出勤するわたし、すてき (*´∀`*)ﾎﾟｯ',
    created_at: Date.today,
    updated_at: Date.today,
    user_id: 1,
    likes_count: 1
  },
  {
    id: 2,
    body: '今日は8,000歩あるいた、すごくない？！！',
    created_at: Date.today,
    updated_at: Date.today,
    user_id: 1
  }
])

Comment.create!(
  id: 1,
  body: '٩(ˊᗜˋ*)و.',
  created_at: Date.today,
  updated_at: Date.today,
  message_id: 1,
  user_id: 1
)

Like.create!(
  id: 1,
  user_id: 1,
  message_id: 1,
  created_at: Date.today,
  updated_at: Date.today
)

Users::Summary.create!(
  user_id: 1,
  messages_count: 2,
  comments_count: 1,
  likes_count: 1,
  created_at: Date.today,
  updated_at: Date.today
)

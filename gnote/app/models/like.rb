class Like < ApplicationRecord
  belongs_to :user
  belongs_to :message, counter_cache: :likes_count
end

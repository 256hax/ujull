class ScrapingPage < ApplicationRecord
  has_many :scraped_code, dependent: :destroy
end

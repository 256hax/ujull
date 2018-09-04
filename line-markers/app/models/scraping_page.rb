class ScrapingPage < ApplicationRecord
  has_many :scraping_texts, dependent: :destroy
end

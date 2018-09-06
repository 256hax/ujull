class ScrapingPage < ApplicationRecord
  has_many :scraped_code, dependent: :destroy
  has_many :diff_code, dependent: :destroy
end

class ScrapingPage < ApplicationRecord
  has_many :scraped_codes, dependent: :destroy
  has_many :diff_codes, dependent: :destroy
end

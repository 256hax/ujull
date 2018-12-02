class ScrapingPage < ApplicationRecord
  has_many :scraping_html_elements, dependent: :destroy
  has_many :diff_codes, dependent: :destroy
end

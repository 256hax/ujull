class ScrapingPage < ApplicationRecord
  has_many :scraping_html_elements, dependent: :destroy
end

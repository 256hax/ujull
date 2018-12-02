class ScrapingHtmlElement < ApplicationRecord
  belongs_to :scraping_page
  has_many :scraped_codes, dependent: :destroy
end

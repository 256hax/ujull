class ScrapedCode < ApplicationRecord
  belongs_to :scraping_page
  has_one :diff_code
end

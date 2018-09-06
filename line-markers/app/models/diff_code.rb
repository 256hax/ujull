class DiffCode < ApplicationRecord
  belongs_to :scraping_page
  belongs_to :scraped_code
end

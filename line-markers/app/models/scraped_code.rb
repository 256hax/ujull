class ScrapedCode < ApplicationRecord
  belongs_to :scraping_page
  has_one :diff_code

  def latest_two(scraping_page_id)
    ScrapedCode.where('scraping_page_id = ?', scraping_page_id).last(2)
  end
end

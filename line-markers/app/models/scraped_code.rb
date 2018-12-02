class ScrapedCode < ApplicationRecord
  belongs_to :scraping_html_element
  has_one :diff_code

  def latest_two(scraping_html_element_id)
    ScrapedCode.where('scraping_html_element_id = ?', scraping_html_element_id).last(2)
  end

  # get previous record with master recode id
  def previous_record(id, scraping_html_element_id, created_at)
    ScrapedCode.order(created_at: :desc, id: :desc).where("id < ? and scraping_html_element_id = ? and created_at <= ?", id, scraping_html_element_id, created_at).first
  end
end

class AddScrapingHtmlElementToScrapedCode < ActiveRecord::Migration[5.2]
  def change
    add_reference :scraped_codes, :scraping_html_element, foreign_key: true
  end
end
# $ rails g migration AddScrapingHtmlElementToScrapedCode scraping_html_element:belongs_to

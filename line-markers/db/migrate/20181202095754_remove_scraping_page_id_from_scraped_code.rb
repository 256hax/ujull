class RemoveScrapingPageIdFromScrapedCode < ActiveRecord::Migration[5.2]
  def change
    remove_column :scraped_codes, :scraping_page_id, :integer
  end
end
# $ rails g migration RemoveScrapingPageIdFromScrapedCode scraping_page_id:integer

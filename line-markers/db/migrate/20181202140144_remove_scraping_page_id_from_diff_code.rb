class RemoveScrapingPageIdFromDiffCode < ActiveRecord::Migration[5.2]
  def change
    remove_column :diff_codes, :scraping_page_id, :integer
  end
end
# $ rails g migration RemoveScrapingPageIdFromDiffCode scraping_page_id:integer

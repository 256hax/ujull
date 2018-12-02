class AddScrapingHtmlElementIdToDiffCode < ActiveRecord::Migration[5.2]
  def change
    add_column :diff_codes, :scraping_html_element_id, :integer
  end
end
# $ rails g migration AddScrapingHtmlElementIdToDiffCode scraping_html_element_id:integer

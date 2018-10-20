class AddCharsetToScrapingPages < ActiveRecord::Migration[5.2]
  def change
    add_column :scraping_pages, :charset, :string
  end
end
# $ rails g migration AddCharsetToScrapingPages charset:string

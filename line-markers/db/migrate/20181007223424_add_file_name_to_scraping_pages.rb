class AddFileNameToScrapingPages < ActiveRecord::Migration[5.2]
  def change
    add_column :scraping_pages, :file_name, :string
    add_column :scraping_pages, :scraping_latest_date, :datetime
  end
end
# $ rails g migration AddFileNameToScrapingPages file_name:string scraping_latest_date:datetime

class AddTitleToScrapingPages < ActiveRecord::Migration[5.2]
  def change
    add_column :scraping_pages, :title, :string
  end
end
# $ rails g migration AddTitleToScrapingPages title:string

class AddDirectoryPathToScrapingPages < ActiveRecord::Migration[5.2]
  def change
    add_column :scraping_pages, :directory_path, :string
  end
end
# $ rails g migration AddDirectoryPathToScrapingPages directory_path:string

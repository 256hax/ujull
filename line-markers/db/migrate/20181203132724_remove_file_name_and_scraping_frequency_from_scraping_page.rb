class RemoveFileNameAndScrapingFrequencyFromScrapingPage < ActiveRecord::Migration[5.2]
  def change
    remove_column :scraping_pages, :file_name, :string
    remove_column :scraping_pages, :scraping_frequency, :integer
  end
end
# $ rails g migration RemoveFileNameAndScrapingFrequencyFromScrapingPage file_name:string scraping_frequency:integer

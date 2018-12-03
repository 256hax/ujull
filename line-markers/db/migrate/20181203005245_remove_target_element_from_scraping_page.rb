class RemoveTargetElementFromScrapingPage < ActiveRecord::Migration[5.2]
  def change
    remove_column :scraping_pages, :target_element, :string
  end
end
# $ rails g migration RemoveTargetElementFromScrapingPage target_element:string

class CreateScrapingPages < ActiveRecord::Migration[5.2]
  def change
    create_table :scraping_pages do |t|
      t.string :page_url
      t.integer :scraping_frequency
      t.string :target_element
      t.boolean :active

      t.timestamps
    end
  end
end
# $ rails g scaffold scraping_page page_url:string scraping_frequency:integer target_element:string active:boolean

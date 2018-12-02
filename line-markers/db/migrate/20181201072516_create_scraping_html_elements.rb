class CreateScrapingHtmlElements < ActiveRecord::Migration[5.2]
  def change
    create_table :scraping_html_elements do |t|
      t.string :target_element
      t.belongs_to :scraping_page, foreign_key: true

      t.timestamps
    end
  end
end
# $ rails g scaffold scraping_html_element target_element:string scraping_page:belongs_to

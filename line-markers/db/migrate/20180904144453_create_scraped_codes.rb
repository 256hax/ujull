class CreateScrapedCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :scraped_codes do |t|
      t.text :html
      t.text :text
      t.belongs_to :scraping_page, foreign_key: true

      t.timestamps
    end
  end
end
# $ rails g scaffold scraped_code html:text text:text scraping_page:belongs_to

class CreateScrapingTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :scraping_texts do |t|
      t.string :body
      t.belongs_to :scraping_page, foreign_key: true

      t.timestamps
    end
  end
end
# $ rails g scaffold scraping_text body:string scraping_page:belongs_to

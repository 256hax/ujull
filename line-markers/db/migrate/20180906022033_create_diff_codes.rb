class CreateDiffCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :diff_codes do |t|
      t.text :html
      t.text :text
      t.datetime :scraped_code_created_at
      t.belongs_to :scraping_page, foreign_key: true
      t.belongs_to :scraped_code, foreign_key: true

      t.timestamps
    end
  end
end
# $ rails g scaffold diff_code html:text text:text scraped_code_created_at:datetime scraping_page:belongs_to scraped_code:belongs_to

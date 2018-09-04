class ChangeDatatypeBodyOfScrapingTexts < ActiveRecord::Migration[5.2]
  def change
    # [形式] change_column(テーブル名, カラム名, データタイプ, オプション)
    change_column :scraping_texts, :body, :text
  end
end
# $ rails g migration change_datatype_body_of_scraping_texts

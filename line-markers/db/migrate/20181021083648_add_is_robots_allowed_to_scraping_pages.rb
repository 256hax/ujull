class AddIsRobotsAllowedToScrapingPages < ActiveRecord::Migration[5.2]
  def change
    add_column :scraping_pages, :is_robots_allowed, :boolean
  end
end
# $ rails g migration AddIsRobotsAllowedToScrapingPages charset:boolean

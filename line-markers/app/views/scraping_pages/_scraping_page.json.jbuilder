json.extract! scraping_page, :id, :page_url, :scraping_frequency, :target_element, :active, :created_at, :updated_at
json.url scraping_page_url(scraping_page, format: :json)
json.extract! scraped_code, :id, :html, :text, :scraping_page_id, :created_at, :updated_at
json.url scraped_code_url(scraped_code, format: :json)

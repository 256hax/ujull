json.extract! scraping_text, :id, :body, :scraping_page_id, :created_at, :updated_at
json.url scraping_text_url(scraping_text, format: :json)

# Schema
## ActiveRecord Associations
[User] 1-n [ScrapingPage] 1-n [ScrapedCode]

## [9] pry(main)> show-models
```
ApplicationRecord
  Table doesn't exist
ScrapedCode
  id: integer
  html: text
  text: text
  scraping_page_id: integer
  created_at: datetime
  updated_at: datetime
  belongs_to :scraping_page
ScrapingPage
  id: integer
  page_url: string
  scraping_frequency: integer
  target_element: string
  active: boolean
  created_at: datetime
  updated_at: datetime
  has_many :scraped_code
```

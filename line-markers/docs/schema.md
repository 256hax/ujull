# Schema
## ActiveRecord Associations
[User] 1-n [ScrapingPage] 1-n [ScrapingText]

## [1] pry(main)> show-models
```
ApplicationRecord
  Table doesn't exist
ScrapingPage
  id: integer
  page_url: string
  scraping_frequency: integer
  target_element: string
  active: boolean
  created_at: datetime
  updated_at: datetime
  has_many :scraping_texts
ScrapingText
  id: integer
  body: string
  scraping_page_id: integer
  created_at: datetime
  updated_at: datetime
  belongs_to :scraping_page
```

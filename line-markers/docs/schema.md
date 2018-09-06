# Schema
## ActiveRecord Associations
[User] 1-n [ScrapingPage]
[ScrapingPage] 1-n [ScrapedCode] 1-1 [DiffCode]
[ScrapingPage] 1-n [DiffCode]

## pry(main)> show-models
```
ApplicationRecord
  Table doesn't exist
DiffCode
  id: integer
  html: text
  text: text
  scraped_code_created_at: datetime
  scraping_page_id: integer
  scraped_code_id: integer
  created_at: datetime
  updated_at: datetime
  belongs_to :scraped_code
  belongs_to :scraping_page
ScrapedCode
  id: integer
  html: text
  text: text
  scraping_page_id: integer
  created_at: datetime
  updated_at: datetime
  belongs_to :scraping_page
  has_one :scraped_diff
ScrapingPage
  id: integer
  page_url: string
  scraping_frequency: integer
  target_element: string
  active: boolean
  created_at: datetime
  updated_at: datetime
  has_many :diff_code
  has_many :scraped_code
```

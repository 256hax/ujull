Rails.application.routes.draw do
  # scraped_codes
  get '/scraped_codes/new/:id', to: 'scraped_codes#new', as: :new_scraped_codes
  resources :scraped_codes, only: [:index, :create, :edit, :show, :update, :destroy]

  # scraping texts
  get '/scraping_texts/new/:id', to: 'scraping_texts#new', as: :new_scraping_text
  resources :scraping_texts, only: [:index, :create, :edit, :show, :update, :destroy]

  resources :scraping_pages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

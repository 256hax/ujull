Rails.application.routes.draw do
  # scraping_pages
  namespace :scraping_pages do
    get 'htmls/create'
  end

  # diff_codes
  get '/diff_codes/new_latest/:id', to: 'diff_codes#new_latest', as: :new_diff_codes_latest
  get '/diff_codes/new/:id', to: 'diff_codes#new', as: :new_diff_codes
  resources :diff_codes, only: [:index, :create, :edit, :show, :update, :destroy]

  # scraped_codes
  get '/scraped_codes/new/:id', to: 'scraped_codes#new', as: :new_scraped_codes
  resources :scraped_codes, only: [:index, :create, :edit, :show, :update, :destroy]

  resources :scraping_pages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

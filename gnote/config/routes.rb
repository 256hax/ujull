Rails.application.routes.draw do
  get '/articles/:action', to: 'static_pages#:action', as: :articles

  scope :comments do
    post '/:message_id/', to: 'comments#create', as: :comment
    get '/:message_id/new', to: 'comments#new', as: :new_comment
  end

  resources :messages

  root to: 'messages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
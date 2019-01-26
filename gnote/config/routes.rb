Rails.application.routes.draw do
  devise_for :users

  %w(about howto).each do | action |
    get "articles/#{action}", controller: 'static_pages', action: action
  end

  scope :comments do
    post '/:message_id/', to: 'comments#create', as: :comment
    get '/:message_id/new', to: 'comments#new', as: :new_comment
    get '/', to: 'comments#index', as: :index_comment
  end

  resources :messages

  root to: 'messages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

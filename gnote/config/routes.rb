Rails.application.routes.draw do
  scope :comments do
    get '/:message_id/new', to: 'comments#new', as: :new_comment
    post '/:message_id/', to: 'comments#create', as: :comment
    delete  '/:id/', to: 'comments#destroy'
    get '/', to: 'comments#index', as: :index_comment
  end

  resources  :messages do
    resources :likes, only: [:create]
  end

  %w(
    about
    howto
  ).each do | action |
    get "articles/#{action}", controller: 'static_pages', action: action
  end

  devise_for :users
  root to: 'messages#index'
end

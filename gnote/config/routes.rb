Rails.application.routes.draw do
  scope :comments do
    post '/:message_id/', to: 'comments#create', as: :comment
    get '/:message_id/new', to: 'comments#new', as: :new_comment
  end
  #resources :comments

  resources :messages

  root to: 'messages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

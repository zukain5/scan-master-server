Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products, only: %i[index show]
  resources :users, only: %i[index show create destroy]
  resources :orders, only: %i[index show create]
  resources :stores, only: %i[index]
  post 'link', to: 'link#create'
  get 'histories/:user_id', to: 'histories#show'
  get 'ping', to: 'ping#index'
  get 'recommends/:user_id', to: 'recommends#show'
  get 'reminds/:user_id', to: 'reminds#show'
  post 'reviews', to: 'reviews#post'
  get 'reviews/:user_id', to: 'reviews#show'
  delete 'users/:user_id/orders', to: 'orders#destroy'
end

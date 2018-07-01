Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :users
  
  resources :products do
  resources :comments
  end
  get 'simple_pages/about'

  get 'simple_pages/contact'

  get 'simple_pages/index'

  root 'simple_pages#landing_page'
  post 'simple_pages/thank_you'

  resources :orders, only: [:index, :show, :create, :destroy]

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

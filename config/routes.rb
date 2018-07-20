Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "user_registration"}
  
  resources :users
  
  resources :products do
  resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]
  
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'payments/create'
  


  root 'simple_pages#landing_page'
  post 'simple_pages/thank_you'
  post 'payments/create'

  

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

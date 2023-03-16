Rails.application.routes.draw do
  resources :contact_infos
  resources :contacts do
    resources :contact_infos
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "contacts#index"
end

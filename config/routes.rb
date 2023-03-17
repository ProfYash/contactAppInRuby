Rails.application.routes.draw do
  resources :contact_infos
  resources :contacts do
    resources :contact_infos
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get "/all_users", to: "users/registrations#allUsers", as: "all_users"
  end
  # Defines the root path route ("/")
  root "contacts#index"
end

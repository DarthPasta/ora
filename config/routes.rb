Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#homepage'

  get 'users/show/:id' => 'users#show', as: 'profile_page'

  resources :offers
  resources :requests
end

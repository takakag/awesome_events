Rails.application.routes.draw do

#  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks", :registration => "users/registration" }
  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  get 'welcome/show'

  resource :user do
	get 'retire'
  end
  

  resources :events do
      resources :tickets, only: [:new, :create, :destroy]
  end

#  match '*path' => 'application#error404', via: :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

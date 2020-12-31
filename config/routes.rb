Rails.application.routes.draw do
  
  resources :contacts
  resources :herbs
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

  root to: 'pages#home'

end

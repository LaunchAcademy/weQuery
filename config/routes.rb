WeQuery::Application.routes.draw do
  get '/dashboard', to: 'dashboard#index'

  resources :sessions, only: [:index] do
    resources :questions, only: [:index, :create]
  end

  resources :questions do
    post "vote"
  end

  namespace :api do
    resources :questions, only: [:index]
  end

  namespace :admin do
    resources :sessions
  end

  # namespace :admin
  #   resources :dashboards
  # end

  get '/auth/:provider/callback', to: 'user_sessions#create'
  get '/auth/invalid/callback', to: 'user_sessions#invalid'
  get 'signout', to: 'user_sessions#destroy', as: 'signout'
  root 'homes#index'
end

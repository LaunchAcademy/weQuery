WeQuery::Application.routes.draw do

  resources :sessions, only: [:index] do
    resources :questions, only: [:index, :create]
  end

  resources :questions do
    resources :votes, only: [:create]
  end

  namespace :api do
    resources :questions, only: [:index]
  end

  namespace :admin do
    resources :sessions do
      resources :archives,
        only: :create,
        controller: :session_archives
    end
    get 'dashboard', to: 'dashboard#index'
  end

  # namespace :admin
  #   resources :dashboards
  # end

  get '/auth/:provider/callback', to: 'user_sessions#create'
  get '/auth/invalid/callback', to: 'user_sessions#invalid'
  get 'signout', to: 'user_sessions#destroy', as: 'signout'
  root 'homes#index'
end

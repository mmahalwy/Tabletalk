Rails.application.routes.draw do
  scope :admin do
    get '/users', to: 'admin#weeks'
    get '/weeks', to: 'admin#weeks', as: 'admin_weeks'
    get '/weeks/:id', to: 'admin#week', as: 'admin_week'
    get '/timeslots', to: 'admin#timeslots', as: 'admin_timeslots'
    get '/timeslots/:id', to: 'admin#timeslot', as: 'admin_timeslot'
    get '/weeks/:id/meetings', to: 'admin#meetings', as: 'admin_week_meetings'
    post '/users/:id/approve', to: 'admin#approve', as: 'admin_approve_user'
    post '/weeks/create_week_and_send_confirmations', to: 'admin#create_week_and_send_confirmations', as: 'admin_create_week_and_send_confirmations'
    post '/create_meetings', to: 'admin#create_meetings', as: 'admin_create_meetings'
  end

  get 'pages/home'
  get 'welcome', to: 'welcome#index'
  # post 'welcome/new', to: 'welcome#new'
  # get '/.well-known/acme-challenge/:id' => 'pages#letsencrypt'
  root to: 'pages#home'

  devise_scope :user do
    get '/sign_in' => 'devise/sessions#new'
    get '/sign_up' => 'devise/registrations#new', as: 'sign_up'
    get '/users/availability' => 'users/registrations#availability',
        as: 'user_availability'
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  resources :availabilities
  resources :meetings, only: [:index] do
    member do
      post :cancel
    end
  end
  resources :users, only: [:show]
  resources :confirmations, only: [:show] do
    collection do
      get :confirm
    end
  end
end

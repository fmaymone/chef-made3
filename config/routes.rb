Rails.application.routes.draw do


  # devise_for :users
  # ActiveAdmin.routes(self)
  resources :menus
  resources :tags
  resources :tests
  resources :documents
  resources :plans
  root 'pages#home'


  devise_for 	:users,
  						:path => '',
  						:path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  						:controllers => {:omniauth_callbacks => 'omniauth_callbacks',
  														 :registrations => 'registrations'
  														},
  						:omniauth_providers => [:google_oauth2]

  # resources :users, only: [:show]
  resources :users
  resources :rooms, :path => 'trabalhos'
  resources :photos
  resources :documents
  resources :tests
  resources :menu_photos
  resources :reservations_rooms



  resources :menus do
    resources :reservations, only: [:create]
  end

  resources :users do
    resources :menus, only: [:create]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :menus do
    resources :reviews, only: [:create, :destroy]
  end
  resources :menus do
    resources :documents, only: [:create, :destroy]
  end



  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'

  get '/your_trips' => 'reservations#your_trips'
  get '/seus_trabalhos' => 'reservations#seus_trabalhos'

  post '/notify' => 'reservations#notify'
  # post '/suas_reservas' => 'reservations#suas_reservas'
  get '/suas_reservas' => 'reservations#suas_reservas'

  get '/search' => 'pages#search'

  get '/pagseguro' => 'checkout#test'

  get '/cadastrar' => 'pages#cadastrar'


end

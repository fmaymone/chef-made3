Rails.application.routes.draw do

  

  devise_for 	:users, 
  						:path => '', 
  						:path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  						:controllers => {:omniauth_callbacks => 'omniauth_callbacks',
                  						  :registrations => 'registrations'
                  						}
  
  root 'pages#home'
  get 'pages/home'
  
  resources :users, only: [:show]
  resources :events
  resources :photos

end

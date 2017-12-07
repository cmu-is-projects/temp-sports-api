Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :teams
  # POST 'login' => 'sessions#create'
  # POST 'logout' => 'sessions#destroy'
  resources :sessions

  resources :surveys

end

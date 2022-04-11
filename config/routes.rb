Rails.application.routes.draw do
  root 'purchases#home'
  get 'about', to:'purchases#about'
  resources :purchases
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :budgets
  resources :reasons, except: [:destroy]
end

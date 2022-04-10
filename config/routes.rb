Rails.application.routes.draw do
  root 'transactions#home'
  get 'about', to:'transactions#about'
  resources :transactions
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :budgets
  resources :reasons, except: [:destroy]
end

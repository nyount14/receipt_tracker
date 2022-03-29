Rails.application.routes.draw do
  root 'transactions#home'
  get 'about', to:'transactions#about'
  resources :transactions
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end

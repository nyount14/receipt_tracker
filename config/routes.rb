Rails.application.routes.draw do
  root 'transactions#home'
  get 'about', to:'transactions#about'
  resources :transactions
end

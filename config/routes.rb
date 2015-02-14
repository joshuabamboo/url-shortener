Rails.application.routes.draw do
  get '*path', to: 'urls#redirect'
  root 'urls#new'
  resources :urls, only: [:create, :show, :index]
end

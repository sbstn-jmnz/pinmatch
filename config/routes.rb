Rails.application.routes.draw do
  get 'home/index'
  get 'random_user/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'roulette', to: 'random_user#new', as: 'random_user'
  patch 'like/:id', to: 'like#update', as: 'like'
  patch 'dislike/:id', to: 'dislike#update', as: 'dislike' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end

Rails.application.routes.draw do

  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users
  
  root 'homes#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

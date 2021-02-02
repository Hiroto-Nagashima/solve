Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users

  resources :posts

  resources :questions, only: [:create, :update , :destroy ,:edit]

  resources :comments, only: [:create, :destroy ]

  resources :likes, only: [:create, :destroy ,:index]
  
  resources :scores, only: [:create, :destroy ]
  
  resources :relationships, only: [:create, :destroy ]
  root 'homes#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

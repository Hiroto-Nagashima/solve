Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users

  resources :posts do
   resources :comments, only: [:create, :destroy ]
   resource :likes, only: [:create, :destroy ,:index]
  end

  resources :questions, only: [:create, :update , :destroy ,:edit]



  resources :scores, only: [:create, :destroy ]

  resources :relationships, only: [:create, :destroy ]

  resources :answers, only: [:create, :destroy ]
  root 'homes#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

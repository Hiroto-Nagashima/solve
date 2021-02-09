Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users do
    get :following, :followers
  end

  get '/posts/confirm', to: 'posts#confirm'
  resources :posts do
   resources :comments, only: [:create, :destroy ]
   resource :likes, only: [:create, :destroy]
  end

  get '/likes/index', to: 'likes#index'

  resources :questions, only: [:create,:destroy,:new]

  resources :scores, only: [:create, :destroy ]

  resources :relationships, only: [:create, :destroy ]

  resources :answers, only: [:create, :destroy ]
  root 'homes#top'

  get '/questions/go', to: 'questions#go'

  get '/comments/eachComment', to: 'comments#eachComment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

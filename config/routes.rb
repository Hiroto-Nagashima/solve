Rails.application.routes.draw do

  get 'ranks/index'

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
  resources :questions, only: [:create,:destroy,:new]

  end
  get '/questions/go', to: 'questions#go'
  post '/questions/save_choice', to: 'questions#save_choice'
  get '/questions/continue', to: 'questions#continue'
  patch '/questions/result', to: 'questions#result'

  get '/likes/index', to: 'likes#index'


  resources :scores, only: [:create, :destroy ]

  resources :relationships, only: [:create, :destroy ]

  resources :answers, only: [:create, :destroy ]
  root 'homes#top'

  get '/comments/eachComment', to: 'comments#eachComment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

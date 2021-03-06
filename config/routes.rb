Rails.application.routes.draw do
  get 'ranks/index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  get '/users/delete', to: 'users#delete'
  resources :users do
    get :following, :followers
    get '/users/follow_list', to: 'users#follow_list'
    get '/users/follower_list', to: 'users#follower_list'
    collection do
      get 'search'
    end
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]

    collection do
      get 'search'
    end

    resources :questions, only: [:create, :update, :destroy, :new] do
      member do
        get :confirm
      end
    end
  end

  get '/questions/go', to: 'questions#go'
  post '/questions/save_choice', to: 'questions#save_choice'
  get '/questions/continue', to: 'questions#continue'
  patch '/questions/result', to: 'questions#result'
  get '/questions/replay', to: 'questions#replay'

  get '/likes/index', to: 'likes#index'

  resources :scores, only: [:create, :destroy]
  resources :answers, only: [:create, :destroy]

  resources :relationships, only: [:create, :destroy]

  root 'homes#top'

  get '/comments/eachComment', to: 'comments#eachComment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

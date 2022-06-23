Rails.application.routes.draw do

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #ユーザー用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  #ゲストユーザー用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  namespace :admin do
    root to: "users#index"
    resources :users, only: [:show, :edit, :update]
    resources :post_study_methods, only: [:show,:index, :destroy] do
      resources :comments, only: [:destroy]
    end
    get "/search", to: "post_study_methods#search"
  end

  scope module: :public do
    root to: "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :subjects, except: [:index, :show]
    resources :tasks, except: [:index, :show] do
      resources :achieved_tasks, only: [:create]
    end
    resources :rewards, except: [:index, :show] do
      resources :exchanged_rewards, only: [:create, :destroy]
    end
    resources :post_study_methods, except: [:new] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    get "/achieved_tasks", to: "achieved_tasks#index"
    get "/favorites", to: "favorites#index"
    get "/search", to: "post_study_methods#search"
    get "/quit", to: "users#quit"
    patch "/out", to: "users#out"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'likes/create'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  # ユーザーのURLを生成するための多数の名前付きルートを利用できるようにするため
  resources :users, only: :show

  get 'posts/index'
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

end
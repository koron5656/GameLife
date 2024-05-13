Rails.application.routes.draw do
  devise_for :users
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  root to: "homes#top"
  #resources :post_images, only: [:new, :create, :index, :show]
  resources :posts, only: [:new, :create, :index, :show]
  get 'homes/about', to: 'homes#about', as: :about
  post 'posts/new' => 'posts/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

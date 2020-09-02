Rails.application.routes.draw do
  get 'gyms/index'
  get 'gyms/show'
  get 'gyms/new'
  get 'gyms/edit'
  get 'restaurants/index'
  get 'restaurants/show'
  get 'restaurants/new'
  get 'restaurants/edit'
  get 'my_restaurants', to: "pages#my_restaurants"
  get 'my_gyms', to: "pages#my_gyms"
  get 'user_dashboard', to: "pages#user_dashboard", as: :user_dashboard
  get 'owner_dashboard', to: "pages#owner_dashboard", as: :ownerdashboard
  get 'favorite', to: "pages#favorite", as: :favorite
  get 'dietary_requirements', to: "pages#dietary_requirements"
  post 'dietary_requirements', to: "pages#create_dietary"
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    post 'favorite', to: 'restaurants#favorite', as: :fav_res
    post 'unfavorite', to: 'restaurants#unfavorite', as: :unfav_res
    resources :dishes
    resources :restaurant_bookings, only: [ :new, :create, :index, :destroy, :show]
    resources :restaurant_reviews, only: :create
  end

  resources :restaurant_bookings, only: [:update, :edit, :destroy, :show]

  resources :gyms do
    resources :gym_classes, only: [:new, :create]
    post 'favorite', to: 'gyms#favorite', as: :fav_gym
    post 'unfavorite', to: 'gyms#unfavorite', as: :unfav_gym
    resources :gym_reviews, only: :create
  end

  resources :class_bookings, only: [:update, :edit, :destroy, :show]

  resources :gym_classes do
    resources :class_bookings, only: [:new, :create, :destroy, :show]
  end

  resources :chatrooms, only: :index

  resources :chatrooms, only: :show do
  resources :messages, only: :create
end
end

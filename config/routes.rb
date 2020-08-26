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
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :restaurant_bookings, only: [:new, :create, :destroy, :show]
    resources :dishes
  end

  resources :gyms do
    resources :gym_classes do
      resources :class_bookings, only: [:new, :create, :destroy, :show]
    end
  end


end

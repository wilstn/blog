Rails.application.routes.draw do
  devise_for :users
  resources :blogs do
    resources :comments
  end
  root 'blogs#index'
end

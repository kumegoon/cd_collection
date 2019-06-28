Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :cds do
    resources :comments, except: :index
  end
  root "cds#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

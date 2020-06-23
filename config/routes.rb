Rails.application.routes.draw do
  resources :projects do
    resources :items, only: [:new, :create, :edit, :update]
  end
  root 'projects#index'
end

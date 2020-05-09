Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end
  root to: 'posts#index'
  get 'post/status_change/:id', to: 'posts#status_change'
end

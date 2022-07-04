Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "posts#index"
  # resources :posts
  resources :posts do
    resources :comments
    # post 'activate', to: 'posts#activate', on: :collection
  end
end

Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  root 'posts#index'
  resources :posts do
    collection do
      delete 'destroy_all_posts', to: 'posts#destroy_all_posts'
    end
  end
end

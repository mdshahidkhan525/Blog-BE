Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  resources :posts do
    collection do
      delete 'destroy_all_posts', to: 'posts#destroy_all_posts'
    end
  end
end

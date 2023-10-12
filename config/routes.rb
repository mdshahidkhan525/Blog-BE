Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    collection do
      delete 'destroy_all_posts', to: 'posts#destroy_all_posts'
    end
  end
end

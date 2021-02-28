Rails.application.routes.draw do
  devise_for :users
  root "posts#index"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :posts
end

Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
 
  # ログアウト機能
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: :show
  resources :posts do
    resources :comments, only: [:create]
  end

end

ChartChallenge::Application.routes.draw do

  devise_for :users, path_names:  { sign_in: 'login', sign_out: 'logout'},
                     controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_for :admins, path_names: { sign_in: 'login', sign_out: 'logout'}

  root to: 'home#index'

  get 'dashboard' => 'dashboard#index', as: :dashboard

  resources :foods
  resources :sleeps
end

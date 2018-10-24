Rails.application.routes.draw do

  #below, I have changed the routes for login, logout and registration; this syntax is specyfic for devise gem -> ,path: ''(...)
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'ruby-portfolios', to: 'portfolios#show_ruby'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
  	member do
  		get :post_status
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/rails/info/routes' => 'routes'

  root to: 'pages#home'
end

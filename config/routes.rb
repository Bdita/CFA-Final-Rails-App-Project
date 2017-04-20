Rails.application.routes.draw do
  resources :images do
       member do
            get 'download'
       end
  end
  devise_for :users
  root 'pages#home'
  get 'admindashboard', to: 'pages#admindashboard'
  get 'ngodashboard', to: 'pages#ngodashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

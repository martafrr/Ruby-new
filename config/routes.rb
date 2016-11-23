Rails.application.routes.draw do
  resources :posts
  get 'welcome/idex'
  root 'welcome#index'
end

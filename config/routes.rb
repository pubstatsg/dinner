Rails.application.routes.draw do
  get 'page/home'
  resources :blocks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/block_trigger', to: 'blocks#trigger'

  root 'page#home'
end

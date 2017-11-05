Rails.application.routes.draw do
  get 'yojee/index'

  root 'yojee#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

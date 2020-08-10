Rails.application.routes.draw do
  root 'staticpages#home'
  resources :posts  do
   resources :answers, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

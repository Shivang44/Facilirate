Rails.application.routes.draw do
  get 'user/login'

  get 'home/index'

  root 'home#index'

  get 'user/signup'

  get 'user/viewProfile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'

  get 'presence/day'
  post 'presence/day'
  get 'presence/mark'
  get 'presence/stats'
  get 'presence/disable'
  get 'presence/select'
  get 'presence/show'
  post 'presence/show'
  get 'users/bulk', to: 'chaltron/users#bulk'
  post 'users/bulk_save', to: 'chaltron/users#bulk_save'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

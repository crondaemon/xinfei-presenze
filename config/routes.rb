Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'

  get 'presences/day'
  post 'presences/day'
  get 'presences/mark'
  get 'presences/stats'
  get 'presences/disable'
  get 'presences/select'
  get 'presences/show'
  post 'presences/show'
  get 'users/bulk', to: 'chaltron/users#bulk'
  post 'users/bulk_save', to: 'chaltron/users#bulk_save'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

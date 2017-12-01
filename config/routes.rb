Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'

  get 'presence/day'
  get 'presence/mark'
  get 'presence/stats'
  get 'presence/disable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

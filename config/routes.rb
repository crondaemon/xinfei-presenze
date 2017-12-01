Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'

  get 'presence/day'
  get 'presence/mark'
  get 'presence/stats'

  resources :users, controller: 'chaltron/users' do
    collection do
      get   'self_show'
      get   'self_edit'
      patch 'self_update'
    end
    member do
      get 'disable'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

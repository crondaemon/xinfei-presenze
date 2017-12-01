Rails.application.routes.draw do
  get 'home/test10'
  get 'home/test9'
  get 'home/test8'
  get 'home/test7'
  get 'home/test6'
  get 'home/test5'
  get 'home/test4'
  get 'home/test3'
  get 'home/test2'
  get 'home/test1'
  root to: 'home#index'
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

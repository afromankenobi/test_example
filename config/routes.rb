Rails.application.routes.draw do
  resources :evaluations
  resources :tests
  resources :courses
  resources :members

  get 'welcome/index'
  get 'welcome/factorial'
  get 'welcome/number_to_words'
  get 'welcome/data_model'
  get 'welcome/oop'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

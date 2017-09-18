Rails.application.routes.draw do
  resources :deals
  resources :alerts

  get '/queue/', to: 'alerts#queue'
  get '/metadata/', to: 'alerts#metadata'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'service#index'
  get '/events/(:org)/(:hostname)' => 'service#events'

  post '/events/:org' => 'service#create'

end

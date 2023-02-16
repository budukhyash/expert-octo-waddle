Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'heart_beat', to: 'application#heart_beat'

  get '/users', to: 'users#pages'

end

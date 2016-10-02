Rails.application.routes.draw do
  post '/mars', to: 'robots#move'
  get '/', to: 'robots#index'
end

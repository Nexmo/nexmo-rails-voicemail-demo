Rails.application.routes.draw do
  get '/', to: 'voicemail#index'
  get '/answer', to: 'voicemail#answer'
  post '/event', to: 'voicemail#event'
  post '/recording', to: 'voicemail#new'
end

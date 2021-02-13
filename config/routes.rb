Rails.application.routes.draw do
  root 'sambal#ls'

  get '/ls', to: 'sambal#ls'
  get '/download', to: 'sambal#download'
  get '/change_theme', to: 'static#change_theme'
end

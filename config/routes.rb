MailReader::Application.routes.draw do

  root "users#sign_in" 
  devise_for :users
  resources :mymail 
end

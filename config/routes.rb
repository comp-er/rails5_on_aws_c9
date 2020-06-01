Rails.application.routes.draw do
    get '/' => 'home#hello_world' 
    get '/index' => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

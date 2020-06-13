Rails.application.routes.draw do
  
  #지금은 쓰고싶은 액션이 3개 뿐이다.
  resources :contacts, only: [:index, :create, :new] 
  #리소스 이용해서 유저라우트 규칙 생성
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  
    get '/' => 'home#hello_world' 
    get '/index' => 'home#index'
    get '/contact' => 'home#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 
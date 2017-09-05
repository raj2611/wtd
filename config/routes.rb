Rails.application.routes.draw do
	root 'pages#home'
	get '/home' , to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :contents do
       member do
         post 'like'
       end

    end
        
    resources :users, except: [:new]
    get '/register', to: 'users#new'

    get '/login', to: "logins#new"
    post '/login', to: "logins#create"
    get '/logout', to: "logins#destroy"

end

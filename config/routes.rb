Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :items do 
        resources :merchants
      end
      namespace :merchants do
        get '/find_all', to: 'search#find_all'
        get '/most_revenue', to: 'search#most_revenue'
      end 
      resources :merchants do 
        resources :items
      end
    end
  end
end

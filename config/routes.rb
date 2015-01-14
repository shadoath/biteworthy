Rails.application.routes.draw do


   resources :restaurants, :menu_groups, :food_items, only: [:index, :show]
#    resources :restaurants, only: [:index, :show] do
#       resources :menu_groups, only: [:index, :show] do
#          resources :food_items, only: [:index, :show]
#       end
#    end

   #TODO admin name spacing
     namespace :admin do
        resources :restaurants, :menu_groups, :food_items
     end

   
   devise_for :users
     # The priority is based upon order of creation: first created -> highest priority.
   


   get '/admin_home', to: 'admin#home', :as => "admin_home"

   root 'base#home'
end

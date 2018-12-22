Rails.application.routes.draw do
  resources :products
  resources :categories
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "products#index"
  

match '/recipes/save_direction' => 'recipes#save_direction', :via => [:post], :as => 'save_direction'

match '/recipes/remove_direction' => 'recipes#remove_direction', :via => [:post], :as => 'remove_direction'

match '/recipes/edit_direction' => 'recipes#edit_direction', :via => [:post], :as => 'edit_direction'



end

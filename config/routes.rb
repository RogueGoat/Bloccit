Rails.application.routes.draw do
  
  resources :topics do
 # #34
  resources :posts, except: [:index]
   end

  get :action=>"show", :controller=>"advertisement"
  get 'about' => 'welcome#about'
  
  root 'welcome#index'
end

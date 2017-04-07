Rails.application.routes.draw do
  
  resources :questions

  resources :posts

  get :action=>"show", :controller=>"advertisement"
  get 'about' => 'welcome#about'
  
  root 'welcome#index'
end

Rails.application.routes.draw do
 # get 'admin/index'

#  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'
  resources :admins
  resources :people
  resources :hive_logins
  
 
   resources :hive_categories 
   
   resources :comments
   
    resources :infos do
       
      collection do

        post 'import' => :import
        get 'active' => :active
        get 'inactive' => :inactive
      put 'checkactivate' => :checkactivate
       put 'checkinactive' => :checkinactive 
        get 'testt' => :testt
      end
      
      member do
      put 'activated' => :activated
           
      end
    end
    
  resources :advancesearches
 
  get 'admin' => 'admin#report'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
   
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'admin#index'

end

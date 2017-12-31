Rails.application.routes.draw do
  

  resources :app_users


  get 'calendar/index'

  get 'contacts/index'

  get 'mail/index'
  get '/commondata' => 'contacts#common_contacts',as: "commondata"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#index'

get 'authorize' => 'auth#gettoken'
end

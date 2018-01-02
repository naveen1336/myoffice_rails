# == Route Map
#
# yarn check v1.3.2
# success Folder in sync.
# Done in 0.15s.
#                   Prefix Verb   URI Pattern                         Controller#Action
#                app_users GET    /app_users(.:format)                app_users#index
#                          POST   /app_users(.:format)                app_users#create
#             new_app_user GET    /app_users/new(.:format)            app_users#new
#            edit_app_user GET    /app_users/:id/edit(.:format)       app_users#edit
#                 app_user GET    /app_users/:id(.:format)            app_users#show
#                          PATCH  /app_users/:id(.:format)            app_users#update
#                          PUT    /app_users/:id(.:format)            app_users#update
#                          DELETE /app_users/:id(.:format)            app_users#destroy
# master_contacts_contacts GET    /contacts/master_contacts(.:format) contacts#mastercontacts
#   master_update_contacts POST   /contacts/master_update(.:format)   contacts#master_update
#                 contacts GET    /contacts(.:format)                 contacts#index
#                          POST   /contacts(.:format)                 contacts#create
#              new_contact GET    /contacts/new(.:format)             contacts#new
#             edit_contact GET    /contacts/:id/edit(.:format)        contacts#edit
#                  contact GET    /contacts/:id(.:format)             contacts#show
#                          PATCH  /contacts/:id(.:format)             contacts#update
#                          PUT    /contacts/:id(.:format)             contacts#update
#                          DELETE /contacts/:id(.:format)             contacts#destroy
#           move_to_master GET    /move_to_master/:id(.:format)       contacts#move_to_master
#           calendar_index GET    /calendar/index(.:format)           calendar#index
#               mail_index GET    /mail/index(.:format)               mail#index
#               commondata GET    /commondata(.:format)               contacts#common_contacts
#                     root GET    /                                   home#index
#                authorize GET    /authorize(.:format)                auth#gettoken
#

Rails.application.routes.draw do


  resources :app_users
  resources :contacts do
    collection do
    get '/master_contacts' => "contacts#mastercontacts"
    post '/master_update' => "contacts#master_update"

  end
  end

  get '/move_to_master/:id', to: "contacts#move_to_master", as: "move_to_master"

  get 'calendar/index'
  get '/sign_out' => "auth#sign_out", as: "sign_out" 
  # get 'contacts/index'

  get 'mail/index'
  get '/commondata' => 'contacts#common_contacts',as: "commondata"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#index'

get 'authorize' => 'auth#gettoken'
end

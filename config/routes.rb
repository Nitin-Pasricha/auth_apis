Rails.application.routes.draw do
  post 'trainers/sign_up'
  post 'trainers/sign_in'
  get 'trainers/account_details/:id', to:'trainers#account_details'
  patch 'trainers/edit_profile/:id', to:'trainers#edit_profile'
  delete 'trainers/delete_account/:id', to:'trainers#delete_account'
  post 'students/sign_up'
  post 'students/sign_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

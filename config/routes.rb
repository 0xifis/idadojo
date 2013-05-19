Ninja::Application.routes.draw do
    root to: "pages#home"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "pages/home"

  get "pages/contact"
  
  get "pages/myteam"

  devise_for :users
  ActiveAdmin.routes(self)
  

end

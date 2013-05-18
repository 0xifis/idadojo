Ninja::Application.routes.draw do
  get "pages/home"

  get "pages/contact"

  devise_for :users
  
  root to: "pages#home"
end

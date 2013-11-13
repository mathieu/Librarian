Librarian::Application.routes.draw do

  # Devise
  devise_for :users

  # Comic
  resources :comics

  # Root of the application => /
  root 'index#index'
end

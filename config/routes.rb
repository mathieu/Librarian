Librarian::Application.routes.draw do

  # Devise
  devise_for :users


  # Root of the application => /
  root 'index#index'
end

Librarian::Application.routes.draw do

  # Devise
  devise_for :users

  resources :loans
  
  # Comic
  resources :comics do
    collection do
      get 'search', :autocomplete_author_name
    end
  end


  # Root of the application => /
  root 'index#index'
end

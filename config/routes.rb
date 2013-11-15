Librarian::Application.routes.draw do

  # Devise
  devise_for :users

  # Loan
  resources :loans
  # Comic
  resources :comics do
    collection do
      get 'search', :autocomplete_author_name
    end
  end

  # User
  resources :users

  # Root of the application => /
  root 'index#index'
end

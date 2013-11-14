Librarian::Application.routes.draw do

  # Devise
  devise_for :users

  # Comic
  resources :comics do
    get :autocomplete_author_name, :on => :collection
  end

  # Root of the application => /
  root 'index#index'
end

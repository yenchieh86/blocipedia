Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root :to => "wikis#index", as: :user_root
  end

  root 'welcome#index'

  get 'about' => 'welcome#about'

  resources :wikis do
    resources :collaborators
  end

  resources :charges, only: [:new, :create]

end

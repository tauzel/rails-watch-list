Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [ :index, :new, :create, :update, :show, :destroy ] do
      resources :bookmarks, only: [ :create ]
  end
  resources :bookmarks, only: [ :destroy ]

  root to: 'lists#index'
end

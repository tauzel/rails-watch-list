Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: [ :index, :new, :create, :show, :destroy ] do
      resources :bookmarks, only: [ :new, :create ]
  end
  resources :bookmarks, only: [ :destroy ]

  # NB: tried to design a route for modal pop-up here
  # get '/lists/:id/bookmarks/new', to: 'bookmarks#new'

  root to: 'lists#index'
end

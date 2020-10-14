Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bands do
    resources :albums, only: [:new] 
    # collection do 
    #   post :albums
    # end
  end

  resources :albums do 
    resources :tracks, only: [:new]
  end

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  # resources :albums, only: [:create, :edit, :show, :update, :destroy]
  resources :tracks, only: [:create, :edit, :show, :update, :destroy]

end

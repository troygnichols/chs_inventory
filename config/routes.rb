ChsInventory::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :items
  resources :tags, path: 'categories', except: [:new, :show, :create]
  resources :locations do
    resources :items_in_stock, except: [:index, :show]
  end

  root to: 'items#index'
end

ChsInventory::Application.routes.draw do
  devise_for :users
  resources :items
  resources :locations do
    resources :items_in_stock, except: [:index, :show]
  end

  root to: 'items#index'
end

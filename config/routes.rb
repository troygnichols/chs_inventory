ChsInventory::Application.routes.draw do
  devise_for :users
  resources :items
  resources :subjects do
    resources :items_in_stock
  end

  root to: 'items#index'
end

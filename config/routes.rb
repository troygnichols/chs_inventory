ChsInventory::Application.routes.draw do
  resources :items
  resources :subjects do
    resources :items_in_stock
  end

  root to: 'subjects#index'
end

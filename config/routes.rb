ChsInventory::Application.routes.draw do
  devise_for :users, skip: [:registrations]

  resources :items
  resources :subjects do
    resources :items_in_stock
  end

  root to: 'subjects#index'
end

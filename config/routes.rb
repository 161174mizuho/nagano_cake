Rails.application.routes.draw do
  
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
  root to: "homes#top"
  get "about" => "homes#about", as: "about"
  get "customers/unsubscribe" => "customers#unsubscribe"
  patch "customers/withdraw" => "customers#withdraw"
  post "orders/:id/confirm" => "orders#confirm"
  get "orders/thanks" => "orders#thanks"
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update]
  resources :cart_items, only: [:index, :update, :destroy, :create]
  delete "cart_items/:destroy_all" => "cart_items#destroy_all"
  resources :orders, only: [:new, :create, :index, :show]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  
end


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    root to: "homes#top"
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index,:show, :update]
    resources :order_details, only: [:update]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

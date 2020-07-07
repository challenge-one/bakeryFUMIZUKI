Rails.application.routes.draw do

#rootパス
root to: 'homes#top'

# 顧客用サイトのrouting
devise_for :customers, controllers: {
	registrations: 'customers/registrations',
	passwords: 'customers/passwords',
	sessions: 'customers/sessions'}

get 'homes/top' => 'homes#top', as: 'customer_top'
get 'homes/about' => 'homes#about', as: 'customer_about'
resources :customers, only: [:edit, :show, :update]
  get 'customers/:id/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
  patch 'customers/:id/withdraw' => 'customers#withdraw_done', as: 'customer_withdraw_done'
  put "/customers/:id/withdraw" => "customers#withdraw_done", as: 'customers_withdraw_done'
resources :orders, only: [:new, :index, :create, :show]
  post 'orders/confirm' => 'orders#confirm', as: 'order_confirm'
  get 'orders/thanks' => 'orders#thanks', as: 'order_thanks'
resources :products, only: [:index, :show]
resources :order_items, only: [:index, :create, :new]
resources :addresses, only: [:index, :create, :edit, :update, :destroy]
resources :genres, only: [:show]

#カートアイテムを全て削除メソッドのために追加
resources :cart_items, only: [:index, :create, :update, :destroy] do
	collection do
		delete 'destroy_all'
	end
end

# 管理者用サイトのrouting
devise_scope :admins do
	devise_for :admins, controllers: {
		registrations: 'admins/registrations',
		passwords: 'admins/passwords',
		sessions: 'admins/sessions'
	}
end

namespace :admins do
	get 'homes/top' => 'homes#top', as:'top'
	resources :customers, only: [:index, :edit, :show, :update]
	resources :products, only: [:index, :create, :new, :edit, :show, :update]
	resources :orders, only: [:index, :create, :show, :update]
	resources :order_items, only: [:index, :create, :show, :update]
	resources :genres, only: [:index, :create, :edit, :update]
	get 'search' => 'searches#search', as: 'search'
end

end

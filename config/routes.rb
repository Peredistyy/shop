Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root :to => 'catalog#list'

    get 'cart', to: 'cart#index'
    post 'cart/add_item'
    post 'cart/clean'

    resources :orders

    devise_for :admins, controllers: {
                          registrations: 'admin/registrations',
                          sessions: 'admin/sessions',
                          passwords: 'admin/passwords'
                      }
    devise_scope :admin do
      get 'admin', to: 'admin/sessions#new'
    end

    devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

    namespace :admin do
      resources :products
      resources :orders
    end
  end

end

Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/ do
    get 'home/index'
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }

    devise_scope :user do
      authenticated :user do
        root 'home#index', as: :authenticated_root
      end
      unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root
      end
    end

    authenticated :user do
      resources :income_categories, except: [:show]
      resources :payment_categories, except: [:show]
      get 'settings', to: 'settings#index'
    end
  end
end

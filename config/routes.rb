Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'signup', to: 'users/registrations#create'
    authenticated :user do
      root 'main_pages#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  authenticated :user do
    # Используйте прямые маршруты без пространства имен
    resources :income_categories, except: [:show]
    resources :payment_categories, except: [:show]
    get 'settings', to: 'settings#index' # Маршрут для настроек без пространства имен
  end
end

Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: "books#index"
  resources :books

  resources :blogs

  resources :blogs do
    resources :entries do
      resources :comments do
        member do
          patch 'approved'
          patch 'unapproved'
        end
      end
    end
  end
end

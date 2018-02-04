Rails.application.routes.draw do
  scope module: :web do
    resources :articles do
      member do
        post :moderate
      end
      scope module: :articles do
        resources :comments do
          scope module: :comments do
            resources :likes, only: [:create]
          end
        end
      end
    end

    root 'welcome#index'
  end

  namespace :moderation do
    resources :articles, only: [:index, :edit, :update]
  end
end

Rails.application.routes.draw do
  scope module: :web do
    resources :articles do
      scope module: :articles do
        resources :comments
      end
    end

    root 'welcome#index'
  end
end

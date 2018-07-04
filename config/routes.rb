Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Your new routes should go right about here...

  scope '/api' do
    # resources :example
    resources :excerpts do
      collection do
        get 'search'
      end
    end

    resources :part_numbers do
      collection do
        get 'search'
      end
    end

    resources :library do
      resources :entries do
        collection do
          post 'search'
        end
      end
    end
  end

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'options/index'
      get 'options/show'
      get 'options/delete'
      get 'options/create'
    end
  end
  namespace :api do
    namespace :v1 do
      resources :contracts
      resources :options
    end
  end
end
